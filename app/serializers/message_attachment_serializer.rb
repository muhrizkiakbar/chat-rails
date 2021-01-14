class MessageAttachmentSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
  attributes :message_id, :attachment_url

end
