class QuotesController < ApplicationController
  before_action :set_quote, only: [:export_pdf]

  def index
    @quotes = Quote.all
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
        redirect_to contacts_path
      end
    else
      render :new
    end
  end

  def export_pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test", disposition: "attachment"   # Excluding ".pdf" extension.
      end
    end
  end

  private

  def quote_params
    params.require(:quote).permit()
  end

  def set_quote
    @quote = quote.find(params[:id])
  end
end
