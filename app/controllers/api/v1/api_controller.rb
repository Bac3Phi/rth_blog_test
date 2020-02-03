class Api::V1::ApiController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
end