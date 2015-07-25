class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate
  
  def index
    render layout: 'frontend'
  end
    
end
