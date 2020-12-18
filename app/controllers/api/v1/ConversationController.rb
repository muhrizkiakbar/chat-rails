class Api::V1::ConversationController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_params_url

  def index
    @conversations = Conversation.includes(:users).where.not(users: {id: current_api_user.id})
    #respond_to do |format| 
      #format.json { render json: @conversations }
    #end 
    render jsonapi: @conversations, include: [
      :users, :messages
    ]
  end

  def show
    render jsonapi: @conversation, include: [
      :messages, :users
    ]
  end

  private

  def set_params_url
    @conversation = Conversation.find(params[:conversation_id])
  end
end
