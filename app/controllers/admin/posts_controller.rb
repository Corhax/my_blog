class Admin::PostsController < Admin::BaseController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new (post_params)
    if @post.save
      redirect_to admin_root_path, notice: "Post succsesfully saved"
    else
      redirect_to admin_root_path
    end
  end

  def edit
  end

  def update
    if @post.update (post_params)
      redirect_to admin_root_path, notice: "Post was succsesfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
      redirect_to admin_root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :slug)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end
end
