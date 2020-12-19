class MessageSerializer
  include JSONAPI::Serializer
  attributes :message, :readed

  belongs_to :user
end
