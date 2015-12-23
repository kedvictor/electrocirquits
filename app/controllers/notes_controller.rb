class NotesController < ApplicationController
  
  layout 'backend'
  
  def index
    @notes = Note.all
  end
  
  def new
    @note = Note.new
    render action: :form
  end

  def create
    @note = Note.new note_params
    if @note.save
      flash[:success] = 'Оголошення створено'
      redirect_to notes_path
    else
      flash[:error] = 'Неможливо створити оголошення'
      render action: :form
    end
  end

  def edit
    @note = Note.find params[:id]
    render action: :form
  end

  def update
    @note = Note.find params[:id]
    if @note.update_attributes note_params
      flash[:success] = 'Оголошення змінено'
      redirect_to notes_path
    else
      flash[:error] = 'Неможливо змінити оголошення'
      render action: :form
    end
  end
  
  def destroy
    @note = Note.find params[:id]
    @note.destroy
    flash[:success] = 'Оголошення видалено'
    redirect_to notes_path
  end
  
  def update_order
    data = params[:data]
    data.each_with_index do |id, index|
      note = Note.find_by_id id
      note.update_attribute( :priority, (100 - index) * 100 ) unless note.nil?
    end
    render :nothing => true
  end
  
  private
  
  def note_params
    params.require(:note).permit(:id, :text, :active)
  end
  
end
 
