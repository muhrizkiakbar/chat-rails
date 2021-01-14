class AddSlugToMessageAttachment < ActiveRecord::Migration[6.0]
  def change
    add_column :message_attachments, :slug, :string
    add_index :message_attachments, :slug, unique: true
  end
end
