class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def export_pdf
    @quote = Quote.find(params[:id])
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
