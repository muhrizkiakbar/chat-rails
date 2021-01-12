class AddSlugToUserConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_conversations, :slug, :string
    add_index :user_conversations, :slug, unique: true
  end
end
