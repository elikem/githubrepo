#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'pry'

require './lib/create'

program :name, 'githubrepo'
program :version, '0.0.1'
program :description, 'Create GitHub repositories from the command line'
program :help, 'Author', 'Elikem Adadevoh <elikem@gmail.com>'

command :create do |c|
  c.syntax = 'githubrepo create [options]'

  c.description = 'githubrepo create REPO_NAME'

  c.example 'usage 1', 'githubrepo create REPO_NAME'
  c.example 'usage 2 -- create is the default action for this gem', 'githubrepo REPO_NAME'

  #the ability to add a description will come later
  #c.example 'description', 'githubrepo create REPO_NAME -d "short description"'
  #c.option '--description STRING', String, 'A short description of the repository'

  c.action do |args, options|
    repository = args.shift
    if repository.nil?
      puts 'invalid option -- githubrepo create REPO_NAME'
      exit
    end

    username = ask 'Username: '
    if username.length == 0
      puts 'invalid option -- please enter a username'
      exit
    end

    password = ask('Password: ') { |char| char.echo = false }

    cli({ :repository => repository, :username => username, :password => password })
  end
end

default_command :create

def cli(attributes)
  puts attributes
  Githubrepo.create(attributes)
  # GitHubRepo.create({ :username => 'elikem', :password => 'testpassword2014', :repository => 'the_goonies' })
end