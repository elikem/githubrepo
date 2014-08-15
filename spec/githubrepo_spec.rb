require 'spec_helper'

describe 'githubrepo' do
  before(:each) do
          @api_data = { "name" => "test_repo",
                        "ssh_url" => "git@github.com:test_user/test_repo.git",
                        "clone_url" => "https://github.com/test_user/test_repo.git" 
                      }
  end

  describe 'repo_url' do
  	it 'copies the clone url to the clipboard and outputs result to the console' do
       expect { Githubrepo.parse_response_from(@api_data, nil) }.to output( "https://github.com/test_user/test_repo.git  ---  COPIED TO CLIPBOARD\n" ).to_stdout
  	end
    it 'copies the ssh url to the clipboard and outputs result to the console' do
       expect { Githubrepo.parse_response_from(@api_data, true) }.to output( "git@github.com:test_user/test_repo.git  ---  COPIED TO CLIPBOARD\n" ).to_stdout
    end
  end
end