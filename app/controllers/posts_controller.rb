class PostsController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_post, only: %i[show]

  def index
    add_breadcrumb "Posts", :posts_path
    @posts = Post.where(is_live: true).order(created_at: :desc)
    expires_in 5.minutes, public: true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @posts}
    end
  end

  def show
    if @post.is_live
      add_breadcrumb "Posts", :posts_path
      add_breadcrumb @post.title, :post_path
      fresh_when @post, public: true
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

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
