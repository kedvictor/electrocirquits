class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate, only: [:index, :preview]
  
  def index
  end
  
  def preview
    set_variables
    render layout: 'frontend'
  end
  
  def generate_page    
    set_variables
    host = ActionController::Base.asset_host
    ActionController::Base.asset_host = request.protocol + request.host_with_port if host.blank?
    str = render_to_string 'preview', layout: 'frontend'
    puts '------------------------------------------------------------'
    puts str
    puts '------------------------------------------------------------'
    render :text => str
  end
  
  private
  
  def set_variables
    @time = Time.now.strftime "%d.%m.%Y %H:%M:%S"
  end
    
end
