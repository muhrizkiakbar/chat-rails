class ConversationSerializer
  include JSONAPI::Serializer
  attributes :id

  has_many :users, serializer: :user
end
