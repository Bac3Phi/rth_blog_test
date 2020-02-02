class Api::V1::ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User
end