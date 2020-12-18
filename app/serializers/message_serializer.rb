class MessageSerializer
  include JSONAPI::Serializer
  attributes :message

  belongs_to :conversation
  belongs_to :user
end
