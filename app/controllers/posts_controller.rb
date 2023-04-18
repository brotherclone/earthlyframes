class PostsController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    add_breadcrumb "Posts", :posts_path
    @posts = Post.where(:is_live => true).order(created_at: :desc)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @posts}
    end
  end

  def show
    if @post.is_live
      add_breadcrumb "Posts", :posts_path
      add_breadcrumb @post.title, :post_path
      respond_to do |format|
        format.html { render :show}
        format.json { render :json => @post}
      end
    else
      respond_to do |format|
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :description, :main_image, :is_live)
  end

end
