class Api::V1::MessageController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:create]

  def create
    @send_message = MessagesServices::SendMessage.call(current_api_user, @user)
  end

  private
  
  def set_params_url
    @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:message)
  end
end
