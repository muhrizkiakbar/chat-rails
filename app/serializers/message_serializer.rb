class MessageSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
  attributes :message, :readed

  belongs_to :user
  has_many :message_attachments
end
