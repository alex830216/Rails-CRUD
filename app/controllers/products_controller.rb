class ProductsController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    render plain: params[:product].inspect
  end

end
