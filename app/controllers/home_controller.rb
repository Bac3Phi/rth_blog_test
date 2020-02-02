class HomeController < ApplicationController
  def index
    newest_posts = Post.newest_posts
    @newest_posts = newest_posts.limit(3)

    @search = newest_posts.ransack(params[:q])
    posts = @search.result.page(params[:page]).per(EasySettings.paging.per)
    service = PostService.new(relation: posts)

    @posts = service.search(search_params)
    @search_params = search_params
  end

  private

  def search_params
    params.permit(:sort_by)
  end
end
