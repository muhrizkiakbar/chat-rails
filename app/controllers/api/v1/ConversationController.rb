class Api::V1::ConversationController < ApplicationController
  before_action :authenticate_api_user!

  def index
    @conversations = Conversation.includes(:users).where.not(users: {id: current_api_user.id})
    #respond_to do |format| 
      #format.json { render json: @conversations }
    #end 
    render jsonapi: @conversations, include: [
      :users
    ]
  end
end
