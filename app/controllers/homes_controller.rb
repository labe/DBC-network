class HomesController < ApplicationController
    def new
    end

    def index
      
    end

    def results
    @user_search = User.search do 
      fulltext params[:search]
    end
    @company_search = Company.search do
      fulltext params[:search]
    end
    @users = @user_search.results
    @companies = @company_search.results 
    end
end
