class Api::V1::ConversationController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url, only: [:show]
  #tasks
  #ordering conversation => done
  #perulangan pengecekan conversation buat jadi lebih simple => done
  #order updated_at conversation when new message coming => done
  #
  
  #additional task
  #add attachment on message (a message have attachments) => WIP

  def index
    @conversations = Conversation.includes(:users).where(conversations: {id: current_api_user.conversations.pluck(:"conversations.id")}).order('conversations.updated_at desc')
    serializer = Conversations::ConversationSerializer.new(@conversations, {params: {current_api_user: current_api_user}, include: [:users, :messages]})
    render json: serializer.serializable_hash
  end

  def show
    @conversation.unread_message(current_api_user).select("messages.id").each do |message|
      readed_message = Message.find(message.id)
      readed_message.readed = true
      readed_message.save
    end
    render json: Conversations::ConversationSerializer.new(@conversation, {params: {current_api_user: current_api_user}, include: [:messages, 'messages.message_attachments']}).serializable_hash
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
    @conversation = Conversation.friendly.find(params[:conversation_id])
  end
end
