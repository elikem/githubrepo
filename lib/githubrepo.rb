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

    Githubrepo.parse_response_from(post, attributes[:wants_ssh])
  end

  # DRY this by moving to a Parse.response_from(post)
  def self.parse_response_from(post, wants_ssh)
    attributes = post

    if wants_ssh
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
        puts repo_url
        Clipboard.copy repo_url
        puts "If xclip is installed, repository URL has been added to your clipboard."
      else
        puts repo_url
      end
    end
    puts message.capitalize if message
    puts error_message.capitalize if error_message
  end
end
