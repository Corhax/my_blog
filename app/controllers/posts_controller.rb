class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  private

    def find_post
      @post = Post.friendly.find(params[:id])
    end
end
