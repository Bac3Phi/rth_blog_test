# frozen_string_literal: true

class PostService
  def initialize(relation: nil)
    @relation = relation
  end

  def search(conditions)
    query = search_query(@relation, conditions[:sort_by])
    query
  end

  private

  def search_query(blog, sort_by)
    case sort_by
    when PostFillter::CREATED_AT_DESC.to_s
      blog.order(created_at: :desc)
    when PostFillter::CREATED_AT_ASC.to_s
      blog.order(created_at: :asc)
    when PostFillter::UPDATED_AT_DESC.to_s
      blog.order(updated_at: :desc)
    when PostFillter::UPDATED_AT_ASC.to_s
      blog.order(updated_at: :asc)
    else
      blog.order(created_at: :desc)
    end
  end
end
