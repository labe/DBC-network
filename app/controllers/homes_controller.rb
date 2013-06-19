class HomesController < ApplicationController
  def new
  end

  def index
    @user_count = User.all.count
    @company_count = Company.all.count
  end

  # Move this to a SearchController
  def results
    @user_search = User.search do 
      fulltext params[:search]
    end
    @company_search = Company.search do
      fulltext params[:search]
    end
    @users = @user_search.results
    @companies = @company_search.results
    @all_results = @users + @companies
  end
end
