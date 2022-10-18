class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
    @post_id = params[:post_id]
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to comments_path, notice: 'Comment was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html do
          redirect_to comment_url(@comment), notice: 'Comment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(@comment.post.id)
    @comment.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  def like
    @comment = Comment.find(params[:id])

    if current_user.liked_comment?(@comment)
      @like = @comment.likes.where(user_id: current_user.id).first
      @like.delete
    else
      @like = @comment.likes.new(user_id: current_user.id)
      @like.save
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :body)
  end
end
