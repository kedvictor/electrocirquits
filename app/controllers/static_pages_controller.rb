class StaticPagesController < ApplicationController
  
  before_action :authenticate, only: :backend
  
  def index
  end
  
  def backend
  end
  
    
end
