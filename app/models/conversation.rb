# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_conversations
  has_many :users, through: :user_conversations
  #has_and_belongs_to_many :users
end
