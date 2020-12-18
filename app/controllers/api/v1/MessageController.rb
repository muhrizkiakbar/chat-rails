class Api::V1::MessageController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:create]

  def create
    @send_message = MessagesServices::SendMessage.call(current_api_user, @user, params[:message])
    if @send_message
      render jsonapi: @send_message, include: [:user]
    else
      render jsonapi_errors: @send_message.errors, status: :unprocessable_entity
    end
  end

  private
  
  def set_params_url
    @user = User.find(params[:user_id])
  end

end
