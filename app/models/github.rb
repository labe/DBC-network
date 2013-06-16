# Nice work on creating a separate class for all the Github access work.
# Some might make the mistake of including this in one of our ActiveRecord
# models, like User
class Github

  # This should be a taken out of the repo ASAP. Your repo is public
  # and not the world can access these keys potentially do malicious things
  # with them, using your names.
  #
  # API keys and other secret stuff should be stored in config files which aren't
  # tracked in GIT or using environment variables i.e. ENV['GITHUB_API_KEY']
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
   self.class.post endpoint, :body => post_body.to_json
   @github = self.class.get users
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
