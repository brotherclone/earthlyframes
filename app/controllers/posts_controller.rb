class PostsController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Posts", :posts_path

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(post_date: :desc).where(is_live: true).last(6)
    @all_posts = Post.all.order(post_date: :desc).where(is_live: true)
    @nav_posts = Post.all.order(post_date: :desc).where(is_live: true).last(8)

    respond_to do |format|
      format.html { render :index}
      format.json {render :json => @all_posts}
    end

  end

  def show

    add_breadcrumb @post.title.to_s, :post_path

    @nav_posts = Post.all.order(post_date: :desc).where(is_live: true).last(8)

    respond_to do |format|
      format.html { render :show}
      format.json {render :json => @post}
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
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
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

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title, :main_image, :inline_image, :description, :overlay_bright, :post_date, :is_live)
  end
end
