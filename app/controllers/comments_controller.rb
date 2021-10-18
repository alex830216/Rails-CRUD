class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @comment.save 
      redirect_to product_path(@product)
    else
    
    end
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :text)      
  end
end
