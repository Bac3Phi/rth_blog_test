# README
Product Link: https://bac3phi-blog.herokuapp.com/
Welcome to Bac3Phi
* Ruby version
  - Ruby 2.6.0
  - Rails 6.0.2

* Feature
  - It can sign in, sign up, forgot password (My config email is buy2build.development@gmail.com)
  - In Home Page, it will show all posts which was submited by user. It can search with title and name of user, sort base on created_at, updated_at. In slider on top, i filter it by comments_count
  - CRUD posts base on current user logged, i used ActionText and DropZone to make better UX
  - User can comment
* Validation Post
  - Title: not blank, max 200 characters
  - Body: not blank
  - Comment: not blank
* Setup
  - if you want recieve local email, please use mailcatcher `gem install mailcatcher`
  - run `git clone https://github.com/Bac3Phi/rth_blog_test.git`
  - run `bundle install --path vendor/bundle `
  - run `yarn install --check-files`
  - run `rails db:create` , `rails db:migrate` , ` rails db:seed` or run `rails db:setup`
* API ( https://bac3phi-blog.herokuapp.com/api/v1/posts )

when you signed in, please check "API TOKEN" in a nav bar. Submit API TOKEN to API with Header name `Authorization`

  - POST   /api/v1/posts/:id/create_comment
  - GET    /api/v1/posts
  - POST   /api/v1/posts
  - GET    /api/v1/posts/new
  - GET    /api/v1/posts/:id/edit
  - GET    /api/v1/posts/:id
  - PATCH  /api/v1/posts/:id
  - PUT    /api/v1/posts/:id
  - DELETE /api/v1/posts/:id

* Problems
  - Heroku just allow save local image for a short time period
  
