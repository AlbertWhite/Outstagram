class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "success"
      redirect_to @post
    else
      flash[:alert] = "alert"
      redirect_to new_posts_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "success"
      redirect_to @post
    else
      flash[:alert] = "alert"
      redirect_to edit_post_path(@post.id)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:caption, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
