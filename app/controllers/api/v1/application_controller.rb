class Api::V1::ApplicationController < ActionController::API
  protect_from_forgery with: :null_session
end