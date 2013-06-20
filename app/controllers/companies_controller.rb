class CompaniesController < ApplicationController
  def new
  end

  def create
    company = Company.create(:website => params[:companies][:website],
                   :name => params[:companies][:name],
                   :location => params[:companies][:location],
                   :initial_email_contact => params[:companies][:initial_email_contact])
    flash[:success] = "Company request form sent. We'll be in touch."
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
    @logo = @company.logo
    @no_contacts = current_user.company_contacts.select{|contact| contact.company_id == @company.id }.empty?
    unless @no_contacts
      @contacted_on = current_user.company_contacts.where(:company_id => @company.id).first.created_at
    end
  end

  def edit
    @company = Company.find(params[:id])
    @logo = @company.logo.url
    @no_contacts = current_user.company_contacts.select{|contact| contact.company_id == @company.id }.empty?
    unless @no_contacts
      @contacted_on = current_user.company_contacts.where(:company_id => @company.id).first.created_at
    end
  end

  def update
     @company = Company.find(params[:id])
     @company.update_attributes(:website => params[:company][:website],
                   :name => params[:company][:name],
                   :location => params[:company][:location],
                   :initial_email_contact => params[:company][:initial_email_contact])
     @company.logo = params[:company][:file]
     @company.save!
     redirect_to :back
  end

end
