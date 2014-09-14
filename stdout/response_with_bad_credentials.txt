irb(main):001:0> Githubrepo.create( { :repository => 'test_repo', :description => 'description', :wants_ssh => false, :username => 'username', :password => 'wrong_password' }  )

=> #<HTTParty::Response:0x7fac9b0302d8 parsed_response={"message"=>"Bad credentials", "documentation_url"=>"https://developer.github.com/v3"}, @response=#<Net::HTTPUnauthorized 401 Unauthorized readbody=true>, @headers={"server"=>["GitHub.com"], "date"=>["Sun, 14 Sep 2014 14:51:36 GMT"], "content-type"=>["application/json; charset=utf-8"], "connection"=>["close"], "status"=>["401 Unauthorized"], "x-github-media-type"=>["github.v3"], "x-ratelimit-limit"=>["60"], "x-ratelimit-remaining"=>["52"], "x-ratelimit-reset"=>["1410708955"], "x-xss-protection"=>["1; mode=block"], "x-frame-options"=>["deny"], "content-security-policy"=>["default-src 'none'"], "content-length"=>["83"], "access-control-allow-credentials"=>["true"], "access-control-expose-headers"=>["ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval"], "access-control-allow-origin"=>["*"], "x-github-request-id"=>["6372ADE0:13B0:62C5FE6:5415AB77"], "strict-transport-security"=>["max-age=31536000; includeSubdomains; preload"], "x-content-type-options"=>["nosniff"]}>

message
Bad credentials

error message
nil

attributes
{"message"=>"Bad credentials", "documentation_url"=>"https://developer.github.com/v3", :repository=>"test_repo", :description=>"description", :wants_ssh=>false, :username=>"username", :password=>"wrong_password"}
