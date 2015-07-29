class StudentsController < ApplicationController
  
  layout 'backend'
  
  before_action :set_group
  
  def index
    get_students_groups
  end
  
  def new
    @student = Student.new group_id: params[:student_group_id]
    render action: :form
  end
  
  def create
    @student = Student.new student_params
    if @student.save
      flash[:success] = 'Студент доданий до групи'
      redirect_to students_path(group_id: @group_id)
    else
      flash[:success] = 'Помилка при створенні студента'
      render action: :form
    end
  end
  
    
  def edit
    @student = Student.find params[:id]
    render action: :form
  end
  
  def update
    @student = Student.find params[:id]
    if @student.update_attributes student_params
      flash[:success] = 'Дані студента змінено'
      redirect_to students_path(group_id: @group_id)
    else
      flash[:success] = 'Помилка при редагуванні студента'
      render action: :form
    end
  end
  
  def destroy
    @student = Student.find params[:id]
    if @student.balls.empty?
      @student.destroy
      flash[:success] = 'Студента видалено'
    else
      flash[:error] = 'Неможливо видалити студента'
    end
    redirect_to students_path( group_id: @group_id)
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
  
  def student_params
    params.require(:student).permit(:id, :title, :group_id, :active)
  end
  
end
