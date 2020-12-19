class MessageBroadCastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      room_id: message.conversation.id,
      message: message.message,
      user: message.user,
      recipient: message.conversation.users.where.not(users: {id: message.user.id})
    }
    ActionCable.server.broadcast(build_conversation(message.conversation.id), payload)
  end

  def build_conversation(id)
    "ConversationRoom-#{id}"
  end
end
