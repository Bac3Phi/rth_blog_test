class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  validates_presence_of :content
end
