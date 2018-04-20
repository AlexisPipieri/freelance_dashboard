class QuotesController < ApplicationController
  before_action :set_quote, only: [ :export_pdf]

  def index
    @quotes = Quote.all
    @organization_list = Organization.where(user: current_user)
  end

  def new
    @quote = Quote.new
    @organization_list = Organization.where(user: current_user)
  end

  def create

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
    @quote = Quote.find(params[:id])
  end
end
