class StaticPagesController < ApplicationController
  
  require "open-uri"
  
  skip_before_action :authenticate, only: [:index, :preview]
  
  def index
  end
  
  def preview
    set_variables
    render layout: 'frontend'
  end
  
  def generate_page    
#    uri = URI.parse("http://electrocirquits.herokuapp.com/backend/preview")
#    http = Net::HTTP.new(uri.host, uri.port)
#    request = Net::HTTP::Get.new(uri.request_uri)
#    puts '-------start request-------------'
#    response = http.request(request)
#    puts '-----------end request-------------'
#    str = response.body.force_encoding('UTF-8')
    #str = Net::HTTP.get('http://localhost:3000', '/backend/preview')
    str = render_to_string 'preview', layout: 'frontend'
    #str = open("http://electrocirquits.herokuapp.com/backend/preview") {|f| f.read }
    puts '-------------------------------------------------------------'
    puts ActionController::Base.asset_host
    host = ActionController::Base.asset_host
ActionController::Base.asset_host = request.protocol + request.host_with_port if host.blank?
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
