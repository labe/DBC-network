class Github

  API_CLIENT_ID     = ENV['GITHUB_API_ID']
  API_CLIENT_SECRET = ENV['GITHUB_API_SECRET']
  
  def initialize(user)
    @user = user
    create_token
  end

  include HTTParty
  headers "User-Agent" => ENV['GITHUB_USER_AGENT']
  basic_auth "Booneteam", ENV['GITHUB_AUTH_PASS']

  def create_token
    endpoint = "https://api.github.com/user"
    users = "https://api.github.com/users/#{@user.github_handle}/repos"
    post_body = {:client_id => API_CLIENT_ID,
     :client_secret => API_CLIENT_SECRET,
   }
   authentication = self.class.post endpoint, :body => post_body.to_json
   response = self.class.get users
    if response.response['status'] == "404 Not Found"
      @github = []
    else
      @github = response
    end
  
 end

 def users_repos
  users = "https://api.github.com/users/#{@user.github_handle}/repos"
 end

 def repo_urls
  repo_urls = @github.map{|x| x['html_url'] }
 end

 def repo_names
  repo_names = @github.map{|x| x['name'] }
 end

 def zip_repo_url_names
  repo_names.zip(repo_urls)
 end

 def gets
  self.class.get users
 end

 def posts

 end
     

end
