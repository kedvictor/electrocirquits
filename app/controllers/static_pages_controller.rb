class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate, only: [:index, :workload, :plan, :qlist]
  
  layout 'frontend'
  
  def index
    page = Page.last.html
    render :text => page
  end
  
  def workload    
  end
  
  def plan    
  end
  
  def qlist
  end
  
  def preview
    set_variables
  end
  
  def generate_page    
    set_variables
    host = ActionController::Base.asset_host
    ActionController::Base.asset_host = request.protocol + request.host_with_port if host.blank?
    str = render_to_string 'preview'
    Page.add_page str, params[:mnemo], params[:permanent]
    render :text => str
  end
  
  private
  
  def set_variables
    @groups = Group.where active: true
    @notes = Note.where active: true
  end
    
end
