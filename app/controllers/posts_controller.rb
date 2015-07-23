class PostsController < ApplicationController

  before_filter :authenticate_user, :only => [:new, :edit, :create, :update]
  before_filter :find_post, :only => [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

  def edit
  end
  
  def show
  end

  def update
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  private

  def authenticate_user
    redirect_to root_path unless user_signed_in?
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :assets_attributes=>[:image])
  end

  def find_post
    @post = Post.find(params[:id]) rescue nil
    redirect_to posts_path unless @post
  end
end
