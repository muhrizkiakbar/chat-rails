class CreateMessageAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :message_attachments do |t|
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
