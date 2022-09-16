class AuthenticationController < ApplicationController
  skip_before_action :authentication_request
  #POST /auth/login
  def login
     @user = User.find_by_username(params[:username])
     if @user
        token = jwt_encode(user_id: @user.id)
        render json: { token: token, username: @user.username, user_id: @user.id }, status: :ok
     else
        render json: { error: 'Unauthorized' }, status: :unauthorized
     end
  end
end
