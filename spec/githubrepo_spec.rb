require 'spec_helper'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe 'Githubrepo' do
  it 'creates a GitHub repo with ssh' do
    VCR.use_cassette('create a repository', :record => :once) do
      attributes = ({ :repository => 'test_repo',
                      :description => 'description',
                      :wants_ssh => true,
                      :username => 'elikem',
                      :password => 'password',
                      :rspec => true
      })

      response =  Githubrepo.create(attributes)
      expect(response['ssh_url']).to eq('git@github.com:elikem/test_repo.git')
    end
  end

  it 'requests to create a Github repo without wants_ssh' do
    VCR.use_cassette('create a repository', :record => :once) do
      attributes = ({ :repository => 'test_repo',
                      :description => 'description',
                      :wants_ssh => false,
                      :username => 'elikem',
                      :password => 'password',
                      :rspec => true
      })

      response =  Githubrepo.create(attributes)
      expect(response['clone_url']).to eq('https://github.com/elikem/test_repo.git')
    end
  end

  it 'should fail with the wrong credentials' do
    VCR.use_cassette('create a repository with bad password', :record => :once) do
      attributes = ({ :repository => 'test_repo',
                      :description => 'description',
                      :wants_ssh => false,
                      :username => 'fake_username',
                      :password => 'wrong_password',
                      :rspec => true
      })

      response =  Githubrepo.create(attributes)
      expect(response['message']).to eq('Bad credentials')
    end
  end

  it 'should return message if repository exists', focus: true do
    VCR.use_cassette('create a existing repository', :record => :once) do
      attributes = ({ :repository => 'test_repo',
                      :description => 'description',
                      :wants_ssh => false,
                      :username => 'elikem',
                      :password => 'password',
                      :rspec => true
      })

      response =  Githubrepo.create(attributes)
      expect(response['errors'].first['message']).to eq('name already exists on this account')
    end
  end
end