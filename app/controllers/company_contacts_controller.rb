class CompanyContactsController < ApplicationController
  def create
    p params
    company_contact = CompanyContact.new(:user_id => params[:company_contact][:user_id],
                                         :company_id => params[:company_contact][:company_id])
    company_contact.save
    redirect_to :back
  end
end
