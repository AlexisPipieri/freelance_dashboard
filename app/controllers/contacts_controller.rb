class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    @organization = Organization.find(params[:organization_id])
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @organization = Organization.find(params[:organization_id])
    @contact.organization = @organization
    if @contact.save
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
