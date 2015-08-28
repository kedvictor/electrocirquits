class GroupsController < ApplicationController
  
  layout 'backend'
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
    render action: :form
  end

  def create
    @group = Group.new group_params
    if @group.save
      flash[:success] = 'Групу створено'
      redirect_to groups_path
    else
      flash[:error] = 'Неможливо створити групу'
      render action: :form
    end
  end

  def edit
    @group = Group.find params[:id]
    render action: :form
  end

  def update
    @group = Group.find params[:id]
    if @group.update_attributes group_params
      flash[:success] = 'Групу змінено'
      redirect_to groups_path
    else
      flash[:error] = 'Неможливо змінити групу'
      render action: :form
    end
  end
  
  def destroy
    @group = Group.find params[:id]
    if @group.students.empty?
      @group.destroy
      flash[:success] = 'Групу видалено'
    else
      flash[:error] = 'Неможливо видалити групу, так як вона звязана зі студентами'
    end
    redirect_to groups_path
  end
  
  def update_order
    data = params[:data]
    data.each_with_index do |id, index|
      group = Group.find_by_id id
      group.update_attribute( :priority, (100 - index) * 100 ) unless group.nil?
    end
    render :nothing => true
  end
  
  private
  
  def group_params
    params.require(:group).permit(:id, :title, :year, :speciality_id, :active)
  end
  
end
 
