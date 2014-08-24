require 'json'
require 'httparty'
require 'clipboard'
require 'os'

module Githubrepo

  # no need for classes (will never create instance of self)... refactor and use just modules and methods
  # http://matt.aimonetti.net/posts/2012/07/30/ruby-class-module-mixins/
  include HTTParty

  def self.create(attributes)

    post = HTTParty.post(
        'https://api.github.com/user/repos',

        :headers => {
            # When API Keys are supported we will want to pass them via the headers
            #'Authorization' => "token #{token}",

            'User-Agent' => 'Githubrepo',
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
        },

        :basic_auth => {
            :username => attributes[:username],
            :password => attributes[:password]
        },

        :body => {
            'name' => attributes[:repository],
            'description' => attributes[:description]
        }.to_json
    )

    Githubrepo.parse_response_from( post.merge(attributes) )
  end

  # DRY this by moving to a Parse.response_from(post)
  def self.parse_response_from(post)
    attributes = post

    if attributes[:wants_ssh]
      repo_url = attributes['ssh_url']
    else
      repo_url = attributes['clone_url']
    end

    message =
        if attributes['message'] != nil
          attributes['message']
        end

    error_message =
        if attributes['errors'] != nil
          attributes['errors'].first['message']
        end

    # messages to console
    if repo_url
      if OS.mac?
        puts "#{repo_url}  ---  COPIED TO CLIPBOARD"
        Clipboard.copy repo_url
      elsif OS.linux?
        # print repo_url
        # unless `which xclip`.empty?
        #   print " --- COPIED TO CLIPBOARD\n"
        #   Clipboard.copy repo_url
        # else
        #   puts "\nInstall xclip if you want to auto-copy repository URL to your clipboard."
        #   puts "debian/ubuntu: apt-get install xclip"
        # end
        print repo_url
        if Gem::Specification::find_all_by_name('ffi').any?
          print " --- COPIED TO CLIPBOARD\n"
          Clipboard.copy repo_url
        else
          puts "Install ruby gem 'ffi' to auto-copy repository to your clipboard."
          puts "gem install ffi"
        end
      elsif OS.windows?
        print repo_url
        if Gem::Specification::find_all_by_name('ffi').any?
          print " --- COPIED TO CLIPBOARD\n"
          Clipboard.copy repo_url
        else
          puts "Install ruby gem 'ffi' to auto-copy repository to your clipboard."
          puts "gem install ffi"
        end
      else
        puts repo_url
      end
    end
    puts message.capitalize if message
    puts error_message.capitalize if error_message
  end
end
