require 'json'
require 'httparty'
require 'clipboard'

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
            'name' => attributes[:repository]

            # feature coming at a future date
            #'description' => description
        }.to_json
    )

    Githubrepo.parse_response_from(post)
  end

  # DRY this by moving to a Parse.response_from(post)
  def self.parse_response_from(post)
    attributes = post

    clone_url =
        if attributes['clone_url'] != nil
          attributes['clone_url']
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
    if clone_url
      puts "#{clone_url}  ---  COPIED TO CLIPBOARD"
      Clipboard.copy clone_url
    end
    puts message.capitalize if message
    puts error_message.capitalize if error_message
  end
end
