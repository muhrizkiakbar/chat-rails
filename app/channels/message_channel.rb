class MessageChannel < ApplicationCable::Channel
  def subscribed
     if params[:conversation_id].present?
       stream_from("ConversationRoom-#{params[:conversation_id]}")
     end
  end

  def speak(data)

    sender = get_sender(data)
    conversation_id = data['conversation_id']
    message = data['message']

    raise 'No Conversation ID' if conversation_id.blank?
    
    convo = get_convo(conversation_id)
    raise 'No Conversation Found' if convo.blank?
    raise 'No Message!' if message.blank?

    convo.users << sender unless convo.users.include?(sender)

    #MessagesServices::SendMessage.call(current_api_user, sender, message)

  end

  def get_convo(conversation)
    Conversation.find(conversation)
  end

  def get_sender(user)
    User.find(user)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
