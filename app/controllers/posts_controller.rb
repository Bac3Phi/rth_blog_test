class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :create_comment]

  def index
    @search = current_user.posts.newest_posts.ransack(params[:q])
    @posts = @search.result.page(params[:page]).per(EasySettings.paging.per)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save if @post.valid?

    @errors = @post.errors.messages
  end

  def update
    @post.update(post_params)

    @errors = @post.errors.messages
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def create_comment
    @comment = @post.comments.new(comment_params)
    redirect_to post_url(@post), notice: 'Comment was successfully created.' and return if @comment.save
    redirect_to post_url(@post), alert: 'Created was failed.'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :feature_image)
  end

  def comment_params
    param = {}
    param[:content] = params[:content]

    param
  end
end
