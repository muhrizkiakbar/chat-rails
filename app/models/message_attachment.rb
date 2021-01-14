class MessageAttachment < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :message
  extend FriendlyId                                                                                                                                       
  friendly_id :slug_candidates, use: :slugged

  attr_reader :attachment_url
                                                                                                                                                                                                       
  has_one_attached :attachment
  validates :attachment, file_size: { less_than_or_equal_to: 1000.kilobytes },                                                                                                                                 
              file_content_type: { allow: ['image/jpg','image/png','image/jpeg', 'application/pdf', 'application/msword'] }                                                                                                                             

  def attachment_url
    rails_blob_path(self.attachment, only_path: true) if self.attachment.attached?
  end
end
