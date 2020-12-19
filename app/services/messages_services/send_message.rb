module MessagesServices
  class SendMessage < ApplicationService

    def initialize user_sender, user_recipient, message
      @user_sender = (user_sender)
      @user_recipient = (user_recipient)
      @message = message
    end

    def call
      if conversation_exist
        send(@conversation, @user_sender)
        return @result_message
      else
        add_conversation
        return @result_message
      end
    end

    def conversation_exist
      conversation_from_sender = @user_sender.conversations.pluck(:"conversations.id")

      result = false

      conversation_from_sender.each do |conversation|
        conversation_check_user = UserConversation.where(conversation_id: conversation).where(user_id: @user_recipient.id).first
        
        if conversation_check_user != nil
          @conversation = conversation_check_user.conversation
          result = true
          break
        end

      end
      
      return result
    end

    def add_conversation
      conversation = Conversation.create({})


      UserConversation.create({
        user: @user_sender,
        conversation: conversation
      })

      UserConversation.create({
        user: @user_recipient,
        conversation: conversation
      })

      send(conversation, @user_sender)
    end

    def send conversation, user
      @result_message = Message.create({
        conversation: conversation,
        user: user,
        message: @message
      })
    end

  end
end
