class ExaminationsController < ApplicationController
  
  layout 'backend'
  
  before_action :set_group
  
  def index
    get_examinations_groups
  end
  
  def show
    @examination = Examination.find params[:id]
  end
  
  def new
    @examination = Examination.new group_id: params[:examination_group_id]
    render action: :form
  end
  
  def create
    groups = params[:duplicate] ? Group.all_active : Group.where(id: params[:examination][:group_id])
    pars = examination_params.clone
    begin
      groups.each do |group|
        pars[:group_id] = group.id
        examination = Examination.where(title: pars[:title], group_id: pars[:group_id]).first_or_create(pars)
        @examination = examination if group.id == params[:examination][:group_id]
      end
      flash[:success] = 'Новий тип оцінювання створено'
      redirect_to examinations_path(group_id: @group_id)
    rescue Exception => e
      puts e.message
      @examination ||= Examination.new examination_params
      flash[:error] = 'Помилка при створенні типу оцінювання'
      render action: :form
    end
  end
    
  def edit
    @examination = Examination.find params[:id]
    render action: :form
  end
  
  def update
    @examination = Examination.find params[:id]
    if @examination.update_attributes examination_params
      flash[:success] = 'Тип оцінювання змінено'
      redirect_to examinations_path(group_id: @group_id)
    else
      flash[:error] = 'Помилка при редагуванні типу оцінювання'
      render action: :form
    end
  end
  
  def destroy
    @examination = Examination.find params[:id]
    if @examination.balls.empty?
      @examination.destroy
      flash[:success] = 'Тип оцінювання видалено'
    else
      flash[:error] = 'Неможливо видалити тип оцінювання'
    end
    redirect_to examinations_path(group_id: @group_id)
  end
  
  def update_order
    data = params[:data]
    data.each_with_index do |id, index|
      examination = Examination.find_by_id id
      examination.update_attribute( :priority, (100 - index) * 100 ) unless examination.nil?
    end
    render :nothing => true
  end

  
  private
  
  def set_group
    @group_id = params[:group_id]
  end
  
  def get_examinations_groups
    if @group_id
      group = Group.find_by_id @group_id
      @groups = [group]
    else
      @groups = Group.where active: true
    end
  end
  
  def examination_params
    params.require(:examination).permit(:id, :title, :short_title, :group_id, 
      :note, :mnemo, :date, :max_value, :weight, :active)
  end
  
end
