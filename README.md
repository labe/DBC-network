# DBConnect : 


##Overview:
**DBConnect** connects DBC Alumni with each other and prospective employers.

##Getting Started:

###Solr 
Run Solr Commands for search function

    bundle install

Install solr:

    rails g sunspot_rails:install
    
 Start solr

    rake sunspot:solr:start
    
 Setup solr

    rake sunspot:reindex

###Delayed_job

add **gem 'delayed_job_active_record'** to your gemfile
add **gem 'daemons'** to your gemfile

Run the migration

    rake db:migrate
    

###Github

Github needs 5 ENV variables.

Set Your ENV variables using 

    export ENV_VAR_NAME=ENV_VAR_VAL
    
Get these from github or whoever has them on your team.

* GITHUB_API_ID  - API ID from Github API
* GITHUB_API_SECRET - API Secret from Github API
* GITHUB_USER_AGENT - App you registered
* GITHUB_AUTH_USER - Username
* GITHUB_AUTH_PASS - User Password

You will also need your email user and pass for gmail

* ALUMNI_MAIL_USER
* ALUMNI_MAIL_PASS
