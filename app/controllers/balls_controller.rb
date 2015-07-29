class BallsController < ApplicationController
  
  layout 'backend'
  
  def index
    @examination = Examination.find params[:examination_id]
  end
  
end
