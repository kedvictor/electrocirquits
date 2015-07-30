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
    str = render_to_string 'preview', layout: 'frontend'
    host = ActionController::Base.asset_host
    ActionController::Base.asset_host = request.protocol + request.host_with_port if host.blank?
    File.open('app/views/static_pages/index.html', 'w') { |file| file.write str }
    redirect_to root_path
  end
  
  private
  
  def set_variables
    @time = Time.now.strftime "%d.%m.%Y %H:%M:%S"
  end
    
end
