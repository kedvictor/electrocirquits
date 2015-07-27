class StudentsController < ApplicationController
  
  layout 'backend'
  
  before_action :set_group
  
  def index
    get_students_groups
  end
  
  def new
    @student = Student.new group_id: @group_id
    render action: :form
  end
  
  def create
    
    redirect_to action: :index
  end
  
    
  def edit
    @student = Student.find params[:id]
    render action: :form
  end
  
  def update
    
    redirect_to action: :index
  end
  
  def destroy
    
    redirect_to action: :index
  end
  
  private
  
  def set_group
    @group_id = params[:group_id]
  end
  
  def get_students_groups
    if @group_id
      group = Group.find_by_id @group_id
      @groups = [group]
    else
      @groups = Group.all
    end
  end
  
end
