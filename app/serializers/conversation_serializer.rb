class ConversationSerializer
  include JSONAPI::Serializer
  attributes :id

  has_many :users, serializer: :user
  has_many :messages
end
