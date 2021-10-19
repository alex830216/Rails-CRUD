class ProductsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    # parmas 是一個 hash，用 [] 可以取得 hash 裡面屬性的值
    @product = Product.new(product_params)
    if @product.save
      # redirect_to @product 會導向 "http://localhost:3000/product/#{@product.id}"
      redirect_to @product
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else

    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :text, :status)
  end

end
