# Githubrepo

This is a fork of a great gem created by [Elikem Adadevoh](https://github.com/elikem). I've added a couple small mods.  
[View original gem](https://github.com/elikem/githubrepo)  

This is a simple Ruby gem that will allow the user to create GitHub a repository with an optional description from the command line. It will copy the new repository path to the clipboard so it can easily be pasted when running `git remote add` 

## Installation

Add this line to your application's Gemfile:

    gem 'githubrepo', :git => 'git://github.com/supremebeing7/githubrepo.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install githubrepo, :git => 'git://github.com/supremebeing7/githubrepo.git'


## Usage

    $ githubrepo create REPOSITORY_NAME

To add an optional repository description:

    $ githubrepo create REPOSITORY_NAME -d REPO_DESCRIPTION

For more details use help flag:

    $ githubrepo --help


## Contributing

Since this is already a fork, I highly encourage you to contribute instead to the [original gem](https://github.com/elikem/githubrepo). However, if you still want to contribute to this one:  

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
