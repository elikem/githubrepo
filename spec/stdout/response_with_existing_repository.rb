irb(main):002:0> Githubrepo.create( { :repository => 'test_repo', :description => 'description', :wants_ssh => false, :username => 'elikem', :password => 'password' }  )

=> #<HTTParty::Response:0x7fdab4bf9d98 parsed_response={"message"=>"Validation Failed", "documentation_url"=>"https://developer.github.com/v3/repos/#create", "errors"=>[{"resource"=>"Repository", "code"=>"custom", "field"=>"name", "message"=>"name already exists on this account"}]}, @response=#<Net::HTTPUnprocessableEntity 422 Unprocessable Entity readbody=true>, @headers={"server"=>["GitHub.com"], "date"=>["Sun, 14 Sep 2014 15:03:15 GMT"], "content-type"=>["application/json; charset=utf-8"], "connection"=>["close"], "status"=>["422 Unprocessable Entity"], "x-ratelimit-limit"=>["5000"], "x-ratelimit-remaining"=>["4999"], "x-ratelimit-reset"=>["1410710595"], "x-github-media-type"=>["github.v3"], "x-xss-protection"=>["1; mode=block"], "x-frame-options"=>["deny"], "content-security-policy"=>["default-src 'none'"], "content-length"=>["215"], "access-control-allow-credentials"=>["true"], "access-control-expose-headers"=>["ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval"], "access-control-allow-origin"=>["*"], "x-github-request-id"=>["6372ADE0:13B0:631282E:5415AE32"], "strict-transport-security"=>["max-age=31536000; includeSubdomains; preload"], "x-content-type-options"=>["nosniff"]}>

message
Validation failed

error message
Name already exists on this account

attributes
{"message"=>"Validation Failed", "documentation_url"=>"https://developer.github.com/v3/repos/#create", "errors"=>[{"resource"=>"Repository", "code"=>"custom", "field"=>"name", "message"=>"name already exists on this account"}], :repository=>"test_repo", :description=>"description", :wants_ssh=>false, :username=>"elikem", :password=>"password"}
