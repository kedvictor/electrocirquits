class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate, only: [:index]
  
  def index
  end
  
  def preview
    set_variables
    render layout: 'frontend'
  end
  
  def generate_page
    set_variables
    str = render_to_string 'preview', layout: 'frontend'
    File.open("app/views/static_pages/index.html", "w") do |file|
      file.write str
    end
    redirect_to root_path
  end
  
  private
  
  def set_variables
    @time = Time.now.strftime "%d.%m.%Y %H:%M:%S"
  end
    
end
