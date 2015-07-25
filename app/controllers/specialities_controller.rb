class SpecialitiesController < ApplicationController
  
  layout 'backend'
  
  def index
    @specialities = Speciality.all
  end

  def new
    @speciality = Speciality.new
    render action: :form
  end

  def create
    @speciality = Speciality.new speciality_params
    if @speciality.save
      flash[:notice] = 'Напрямок/спеціальність створено.'
      redirect_to specialities_path
    else
      render action: :new
    end
  end

  def edit
    @speciality = Speciality.find params[:id]
    render action: :form
  end

  def update
    @speciality = Speciality.find params[:id]
    if @speciality.update_attributes speciality_params
      flash[:notice] = 'Напрямок підготовки змінено.'
      redirect_to specialities_path
    else
      render action: :edit
    end
  end
  
  def destroy
    @speciality = Speciality.find params[:id]
    if @speciality.groups.empty?
      @speciality.destroy
      flash[:notice] = 'Напрямок підготовки видалено.'
    else
      flash[:error] = 'Неможливо видалити напрямок підготовки, так як він звязаний з групами.'
    end
    redirect_to specialities_path
  end
  
  private
  
  def speciality_params
    params.require(:speciality).permit(:id, :title, :short_title)
  end
  
end
