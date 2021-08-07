class CommentsController < ApplicationController
  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @comment = @food_item.comments.create(comment_params)
    @comment.save
    redirect_to show_path(@food_item)
  end

  def destroy
    @food_item = FoodItem.find(params[:food_item_id])
    @comment = @food_item.comments.find(params[:id])
    @comment.destroy
    redirect_to show_path(@food_item)
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content, :buyer_id, :seller_id, :food_item_id)
    end
end
