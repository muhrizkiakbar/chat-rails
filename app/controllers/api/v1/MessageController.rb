class Api::V1::MessageController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:create]

  def create
    puts params[:message]
    puts params
    puts current_api_user
    puts "*" * 100
    @send_message = MessagesServices::SendMessage.call(current_api_user, @user, params[:message])
    render json: "tes"
  end

  private
  
  def set_params_url
    @user = User.find(params[:user_id])
  end

  def message_params
    #params.require(:message).permit(:message)
    params[:message]
  end
end
