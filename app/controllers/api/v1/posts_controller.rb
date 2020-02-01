class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = current_user.posts.new(post_params)

    render json: @post and return if @post.save
    render json: { error: 'Unable to create Post.' }, status: 400
  end

  def update
    post = @post.update(post_params)

    render json: { message: 'Post successfully updated'}, status: 200 and return if post
    render json: { error: @post.errors }, status: 400
  end

  def destroy
    @post.destroy

    render json: { message: 'Post successfully deleted'}, status: 200
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :feature_image)
  end
end
