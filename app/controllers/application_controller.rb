class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authentication_request
  private
  def authentication_request
     header = request.headers['Authorization']
     header = header.split(' ').last if header
     decoded = jwt_decode(header)
     @current_user_id = User.find(decoded[:user_id])
  end
end
