# Githubrepo
This gem is a Command Line Interface to do only thing... create GitHub repositories.

## Installation

Download this gem:

    $ gem install githubrepo


## Usage

    $ githubrepo create REPOSITORY_NAME  
    $ githubrepo REPOSITORY_NAME
    

The default operation on githubrepo is to create, so you can skip the create action.
For more details use help flag:

    $ githubrepo --help


## Development
To run the app in IRB for debugging run

    $ rake console
    $ Githubrepo.create(attributes)
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
