namespace :images do
  desc 'Reload image'
  task reload_image: :environment do
    Post.all.each do |p|
      p.feature_image.attach(io: random_default_feature_image, filename: 'default.jpg', content_type: "image/jpg" )
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