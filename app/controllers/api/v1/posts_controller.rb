class Api::V1::PostsController < Api::V1::ApiController
  before_action :authenticate_user_from_token
  before_action :find_post, only: [:show, :edit, :update, :destroy, :create_comment]

  def index
    @search = current_user.posts.newest_posts.ransack(params[:q])
    @posts = @search.result.page(params[:page]).per(EasySettings.paging.per)

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = current_user.posts.new(post_params)

    render json: @post and return if @post.save
    render json: { error: @post.errors.messages }, status: 400
  end

  def update
    post = @post.update(post_params)

    render json: { message: 'Post successfully updated'}, status: 200 and return if post
    render json: { error: @post.errors.messages }, status: 400
  end

  def destroy
    @post.destroy

    render json: { message: 'Post successfully deleted'}, status: 200
  end

  def create_comment
    @comment = @post.comments.new(comment_params)

    render json: { message: 'Comment was successfully created.'}, status: 200 and return if @comment.save
    render json: { error: 'Created was failed.' }, status: 400
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :feature_image)
  end

  def comment_params
    param = {}
    param[:content] = params[:content]

    param
  end

  def authenticate_user_from_token
    render json: {message: "You are not authenticated"},
      status: 401 if current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by authentication_token: request.headers["Authorization"]
  end
end
