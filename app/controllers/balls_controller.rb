class BallsController < ApplicationController
  
  layout 'backend'
  
  def index
    @examination = Examination.find params[:examination_id]
    @balls = @examination.balls.index_by &:student_id
  end
  
  def edit_ball
    @examination = Examination.find params[:examination_id]
    @student = Student.find params[:student_id]
    @ball = Ball.where(examination_id: @examination.id, student_id: @student.id).first_or_create
    render 'student_ball_form'
  end
  
  def update_ball
    @examination = Examination.find params[:examination_id]
    @student = Student.find params[:student_id]
    @ball = Ball.where(examination_id: @examination.id, student_id: @student.id).first_or_create
    @ball.update_attribute :value, params[:ball]
    @ball.reload
    render 'student_ball_row'
  end
  
  def view_ball
    @examination = Examination.find params[:examination_id]
    @student = Student.find params[:student_id]
    @ball = Ball.where(examination_id: @examination.id, student_id: @student.id).first_or_create
    render 'student_ball_row'
  end
  
end
