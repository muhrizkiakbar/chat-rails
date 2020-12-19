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
class Message < ApplicationRecord
  self.default_scope {order('created_at ASC')}
  belongs_to :conversation
  belongs_to :user

  validates :message, presence: true

  #after_create_commit :send_channel
  #after_create_commit{ MessageBroadCastJob.perform_later(self) }

  #def send_channel
    #payload = {
      #room_id: self.conversation.id,
      #message: self.message,
      #user: self.user,
      #recipient: self.conversation.users.where.not(users: {id: self.user.id})
    #}
    #ActionCable.server.broadcast("ConversationRoom-#{self.conversation.id}", payload)
  #end


end
