class CommentsController < ApplicationController
  def create
    # find associtaed product id that comment(s) will be displayed on, pass comment params that are stored in comment_params method
    # locate current signed-in user using devise pre-loaded method current_user, save comment and redirect user to commented product path
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_prarms)
    @comment.user = current_user
    if @comment.save
      redirect_to products_path(@product)
    else
      flash[:error] = "Something went wrong!"
    end
  end

  def destroy
  end

  private
  def comment_prarms
    params.require(:comment).permit(:user_id, :body, :rating)
  end
end
