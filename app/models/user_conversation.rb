# == Schema Information
#
# Table name: user_conversations
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class UserConversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
end
