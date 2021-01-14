# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#  message         :text
#  readed          :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Conversations::MessageSerializer
  include JSONAPI::Serializer
  attributes :message, :readed, :slug

  #belongs_to :conversation
  belongs_to :user, serializer: Conversations::UserSerializer
  has_many :message_attachments, serializer: MessageAttachmentSerializer 
  #has_many :message_attachments, serializer: MessageAttachmentSerializer, meta: Proc.new {|message, params| 
    #{
      #:attachment_url => message.message_attachments.attachment_url
    #}
  #}

end
