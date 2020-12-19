class Api::V1::ConversationController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:show]

  def index
    @conversations = Conversation.includes(:users).where.not(users: {id: current_api_user.id})
    serializer = Conversations::ConversationSerializer.new(@conversations, {params: {current_api_user: current_api_user}, include: [:users, :messages]})
    render json: serializer.serializable_hash
  end

  def show
    @conversation.unread_message(current_api_user).select("messages.id").each do |message|
      readed_message = Message.find(message.id)
      readed_message.readed = true
      readed_message.save
    end
    render json: Conversations::ConversationSerializer.new(@conversation, {params: {current_api_user: current_api_user}, include: [:messages]}).serializable_hash
  end

  def destroy
    if @conversation.delete
      render json: @conversation, status: :ok
    else
      render jsonapi_errors: @conversation.errors, status: :unprocessable_entity
    end
  end

  private


  def set_params_url
    @conversation = Conversation.find(params[:conversation_id])
  end
end
