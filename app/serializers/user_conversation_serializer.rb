class UserConversationSerializer
  include JSONAPI::Serializer
  attributes 
  belongs_to :user
  belongs_to :conversations
end
