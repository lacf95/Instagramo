# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc), items: 10)
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = Post.new(post_params)
    return redirect_to root_path if @post.save

    render :new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :image)
      .merge(user: current_user)
  end
end
