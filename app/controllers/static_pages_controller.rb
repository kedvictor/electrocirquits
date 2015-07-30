class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate, only: [:index]
  
  def index
    page = Page.last.html
    render :text => page, layout: 'frontend'
  end
  
  def preview
    set_variables
    render layout: 'frontend'
  end
  
  def generate_page    
    set_variables
    host = ActionController::Base.asset_host
    ActionController::Base.asset_host = request.protocol + request.host_with_port if host.blank?
    str = render_to_string 'preview'
    Page.add_page str, params[:mnemo], params[:permanent]
    render :text => str, layout: 'frontend'
  end
  
  private
  
  def set_variables
    @time = Time.now.strftime "%d.%m.%Y %H:%M:%S"
    @groups = Group.where active: true
  end
    
end
