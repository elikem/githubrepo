# Githubrepo
This gem is a Command Line Interface to do only one thing... create GitHub repositories.

## Installation

Download this gem:

    $ gem install githubrepo


## Usage

    $ githubrepo create REPO_NAME
    $ githubrepo REPO_NAME
    $ githubrepo REPO_NAME -d "short description"

    # To get back the SSH URL instead of HTTP, add the -s or --ssh flag:
    $ githubrepo REPOSITORY_NAME -s



The default operation on githubrepo is to create, so you can skip the create action.
For more details use help flag:

    $ githubrepo --help


## Development
To see available rake tasks for development
    
    $ rake -T
    
To run the app in IRB for debugging run

    $ rake console
    $ Githubrepo.create ({ :repository => 'test_repo',
                           :description => 'description',
                           :wants_ssh => false,
                           :username => 'username',
                           :password => 'password',
                           :rspec => true # returns response hash instead of nil
     })


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request to Dev
