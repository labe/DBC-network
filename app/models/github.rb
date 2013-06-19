class Github

  # Don't forget to get these out of your repo!
  API_CLIENT_ID     = '1c6c41f9e816f60f3b50'
  API_CLIENT_SECRET = 'd8c9d91988a81c0f9fb5787f33024980c60414d9'
  
  def initialize(user)
    @user = user
    create_token
  end

  include HTTParty
  headers "User-Agent" => "Portfolio Cloud"
  basic_auth "Booneteam", "Whatsup11"

  def create_token
    endpoint = "https://api.github.com/user"
    users = "https://api.github.com/users/#{@user.github_handle}/repos"
    post_body = {:client_id => API_CLIENT_ID,
     :client_secret => API_CLIENT_SECRET,
   }
   authentication = self.class.post endpoint, :body => post_body.to_json
   response = self.class.get users
   # fix the indentation here.
   # Also, checking for a hardcoded error means you're gonna have a bad time.
   # Instead, use a method like response.success? instead
    if response.response['status'] == "404 Not Found"
      @github = []
    else
      @github = response
    end
  
 end

 def users_repos
  # no need for the tmp variable 'users'
  users = "https://api.github.com/users/#{@user.github_handle}/repos"
 end

 def repo_urls
  # no need for the tmp variable 'repo_urls'
  repo_urls = @github.map{|x| x['html_url'] }
 end

 def repo_names
  # no need for the tmp variable
  repo_names = @github.map{|x| x['name'] }
 end

 def zip_repo_url_names
  # nice use of zip, don't see this often
  repo_names.zip(repo_urls)
 end

 def gets
  self.class.get users
 end

 # remove the empty method
 def posts

 end
     

end
