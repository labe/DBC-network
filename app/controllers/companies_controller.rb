class CompaniesController < ApplicationController
  def new
  end

  def create
    Company.create(:website => params[:companies][:website],
                   :name => params[:companies][:name],
                   :location => params[:companies][:location],
                   :initial_email_contact => params[:companies][:initial_email_contact])
    redirect_to :back
  end

  def status
    @company = Company.find(params[:company][:id])
    @company.status = params[:company][:status]
    @company.save
    redirect_to :back
  end

  def index
    @companies = Company.where(:status => "active")
    @groupable = "Companies"
  end

  def show
    @company = Company.find(params[:id])
    @no_contacts = current_user.company_contacts.select{|contact| contact.company_id == @company.id }.empty?
    unless @no_contacts
      @contacted_on = current_user.company_contacts.where(:company_id => @company.id).first.created_at
    end
  end
end
