class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :feature_image
  has_rich_text :body

  validates_presence_of :body, :title
  validates_length_of :title, maximum: 200

  after_commit :add_default_feature_image, on: [:create, :update]

  scope :impressed_posts, -> { list([], comments_count: :DESC) }
  scope :newest_posts, -> { list([]) }
  scope :list, -> (conditions, order = nil, include_items = nil) do
    include_items ||= [:rich_text_body, :user, feature_image_attachment: [:blob]]
    query = includes(include_items)

    conditions.each do |condition|
      query = query.where(condition)
    end

    query = query.order(order) if order.present?
    query
  end

  private

  def add_default_feature_image
    unless feature_image.attached?
      self.feature_image.attach(io: random_default_feature_image, filename: 'default.jpg', content_type: "image/jpg" )
    end
  end

  def random_default_feature_image
    random_feature_images = [
      'img_5.jpg',
      'img_7.jpg',
      'img_8.jpg',
      'img_9.jpg',
      'img_10.jpg'
    ]

    File.open(Rails.root.join("app", "assets", "images", "posts", random_feature_images.sample))
  end
end
