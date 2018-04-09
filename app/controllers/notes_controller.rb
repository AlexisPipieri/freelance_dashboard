class NotesController < ApplicationController

  def create
    @contact = Contact.find(params[:contact_id])
    @note = Note.new(note_params)
    @note.contact = @contact
    if @note.save
      respond_to do |format|
        format.html { redirect_to "contacts/show_partial", contact: @contact }
        format.js  # <-- will render `app/views/notes/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render "contacts/show_partial", contact: @contact }
        format.js  # <-- idem
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:date, :description)
  end
end
