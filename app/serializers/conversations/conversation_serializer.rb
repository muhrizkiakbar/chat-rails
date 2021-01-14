class Conversations::ConversationSerializer
  include JSONAPI::Serializer
  attributes :id, :slug

  has_many :users, serializer: Conversations::UserSerializer, meta: Proc.new {|conversation_data, params| 
    #{:unread_message_count => conversation_data.unread_message(params[:current_api_user]).count} 
      {
        :preview_last_message => conversation_data.messages.last,
        :unread_message_count => conversation_data.unread_message(params[:current_api_user]).count
      } 
  } 
  #has_many :users
  has_many :messages
end
