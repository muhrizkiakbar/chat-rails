module MessagesServices
  class SendMessage < ApplicationService

    def initialize user_sender, user_recipient, message
      @user_sender = (user_sender)
      @user_recipient = (user_recipient)
      @message = message
    end

    def call
      conversation_exist
    end

    def conversation_exist
      conversation_from_sender = @user_sender.conversations.pluck(:"conversations.id")
    end

    def add_conversation
      conversation = Conversation.create()
      user_conversation_sender = UserConversation.create({
        user: @user_sender,
        conversation: conversation
      })
      user_conversation_recipient = UserConversation.create({
        user: @user_recipient,
        conversation: conversation
      })
    end

    def send
      Message.create({
        conversation: conversation,
        user: user,
        message: message
      })
    end

  end
end
