require 'json_web_token'
class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request 
  
  def sign_in
      command = AuthenticateUser.call(params[:username], params[:password]) 
      if command.success? 
        render json: { auth_token: command.result } 
      else render json: { error: command.errors }, status: :unauthorized 
      end 
  end

  def sign_up
    user=User.new(user_params)
    if user.save
      render json: { auth_token: response_token(user) } 
    else
      render json: user.errors.full_messages,status: :unprocessable_entity
    end
  end

  def logout
  end

  private 
  
  def response_token(user)
   return JsonWebToken.encode(email: user.email) 
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:contact,:role)
  end
end
