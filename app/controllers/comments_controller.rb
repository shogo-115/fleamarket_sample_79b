class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id])}
        format.json
      end
    else
      render :create and return
    end
  end

  def destroy
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
