class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('post-form', partial: 'form'),
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @post = Post.find(params[:id])

    if current_user.liked?(@post)
      @like = @post.likes.where(user_id: current_user.id).first
      @like.delete
    else
      @like = @post.likes.new(user_id: current_user.id)
      @like.save
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: private_stream
      end
    end
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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
end
