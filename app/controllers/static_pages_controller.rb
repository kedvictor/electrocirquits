class StaticPagesController < ApplicationController
  
  before_action :authenticate, only: :backend
  
  def index
    render layout: 'frontend'
  end
  
  def backend
    render layout: 'backend'
  end
  
    
end
