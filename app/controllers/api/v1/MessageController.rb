class Api::V1::MessageController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:create]

  def create
    @send_message = MessagesServices::SendMessage.call(current_api_user, @user, params)
    if !@send_message.errors.any?
      render json: MessageSerializer.new(@send_message, {include: [:message_attachments]})
    else
      render jsonapi_errors: @send_message.errors, status: :unprocessable_entity
    end
  end

  private
  
  def set_params_url
    @user = User.friendly.find(params[:user_id])
  end

end
