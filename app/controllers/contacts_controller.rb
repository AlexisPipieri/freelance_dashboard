class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @contact = Contact.new
    @organization_list = Organization.where(user: current_user)
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      if contact_params[:organization_id].empty?
        redirect_to new_organization_path(contact_id: @contact.id)
      else
        redirect_to contact_path(@contact)
      end
    else
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number,
      :email, :organization_id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
