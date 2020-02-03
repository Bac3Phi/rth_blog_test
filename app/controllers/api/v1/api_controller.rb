class Api::V1::ApiController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery :null_session
end