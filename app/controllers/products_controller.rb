class ProductsController < ApplicationController
  def index
  end
  
  def show
    @product = Product.find(params[:id])    
  end
  
  def new
  end

  def edit

  end

  def create
    # parmas 是一個 hash，用 [] 可以取得 hash 裡面屬性的值
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
  def product_params
    params.require(:product).permit(:title, :text)
  end

end
