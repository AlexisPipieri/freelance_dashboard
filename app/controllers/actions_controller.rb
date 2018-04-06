class ActionsController < ApplicationController
  def create
    raise
    @contact = Contact.find(params[:contact_id])
    @action = Action.new(action_params)
    @action.contact = @contact
    if @action.save
      redirect_to contact_path(@contact)
    else
      render 'contact/show'
    end
  end

  private

  def action_params
    params.require(:action).permit(:date, :description)
  end
end
