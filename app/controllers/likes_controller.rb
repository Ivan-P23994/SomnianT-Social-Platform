class LikesController < ApplicationController

  def new
    @post = Post.find(params[:liked_on_id])
    @like = current_user.likes.new(like_params)
    @like.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: private_stream
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to controller: :dashboard, action: :index
  end

  private

  def private_stream
    private_target = "#{helpers.dom_id(@post)} private_likes"
    turbo_stream.replace(private_target,
                         partial: 'shared/like_button',
                         locals: {
                           post: @post,
                           like_status: current_user.liked?(@post)
                         })
  end

  def set_like
    @like = Like.where(liked_on_id: params[:id])
  end

  def like_params
    params.permit(:liked_on_type, :liked_on_id, :user_id)
  end
end
