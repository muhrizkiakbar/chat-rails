# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Conversation < ApplicationRecord
  extend FriendlyId                                                                                                                                       
  friendly_id :slug_candidates, use: :slugged

  has_many :messages, dependent: :destroy
  has_many :user_conversations
  has_many :users, through: :user_conversations


  def unread_message(object)
    self.messages.where.not(messages: {user: object}).where(messages: {readed: false}).where(messages: {conversation: self})
  end 
end
