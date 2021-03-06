class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    @contact = Contact.find(params[:contact_id])
    @contact.organization = @organization
    if @organization.save
      @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @organization.update
    redirect_to organization_path(@organization)
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

end
