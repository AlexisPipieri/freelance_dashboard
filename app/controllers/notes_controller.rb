class NotesController < ApplicationController

  def create
    @contact = Contact.find(params[:contact_id])
    @note = Note.new(note_params)
    raise
    @note.contact = @contact
    if @note.save
      redirect_to contact_path(@contact)
    else
      render 'contact/show'
    end
  end

  private

  def note_params
    params.require(:note).permit(:date, :description)
  end
end
