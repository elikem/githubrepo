require 'spec_helper'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe 'githubrepo' do
  # before(:each) do
  #         @api_data = { 'name' => 'test_repo',
  #                       'ssh_url' => 'git@github.com:test_user/test_repo.git',
  #                       'clone_url' => 'https://github.com/test_user/test_repo.git'
  #                     }
  # end
  #
  # context 'gets repo_url' do
  # 	it 'copies the clone url to the clipboard and outputs result to the console' do
  #      expect { Githubrepo.parse_response_from(@api_data, nil) }.to output( "https://github.com/test_user/test_repo.git  ---  COPIED TO CLIPBOARD\n" ).to_stdout
  # 	end
  #   it 'copies the ssh url to the clipboard and outputs result to the console' do
  #      expect { Githubrepo.parse_response_from(@api_data, true) }.to output( "git@github.com:test_user/test_repo.git  ---  COPIED TO CLIPBOARD\n" ).to_stdout
  #   end
  # end

  context 'makes Github requests with vcr' do
    it 'requests to create a github repo WITH wants_ssh' do
      VCR.use_cassette('create a repository', :record => :once) do
        attributes = ({ :repository => 'test_repo', :description => 'description', :wants_ssh => true, :username => 'elikem', :password => 'password' })

        result = Githubrepo.create(attributes)
        # test expectation as normal
        # vcr stores network requests in fixtures/vcr_cassettes
        # its interesting to look at
      end
    end

    it 'requests to create a Github repo WITHOUT wants_ssh' do
      pending
    end

    it 'should fail with the wrong credentials' do
      pending
    end
  end
end