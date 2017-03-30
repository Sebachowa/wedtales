class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :template
  has_many :guests
  has_attachment  :og_photo, accept: [:jpg, :png, :gif]
  has_attachment  :groom_photo, accept: [:jpg, :png, :gif]
  has_attachment  :bride_photo, accept: [:jpg, :png, :gif]
  has_attachments :gallery, maximum: 4
  # validates :groom_name, presence: true
  # validates :groom_bio, presence: true
  # validates :bride_name, presence: true
  # validates :bride_bio, presence: true
  # validates :location, presence: true
  # validates :date, presence: true
  # validates :wedding_description, presence: true
  # validates :og_title, presence: true
  # validates :og_description, presence: true
  # validates :story_title, presence: true
  # validates :draft, presence: true


  def to_param
    custom_url.nil? ? id.to_s : "#{id}-#{custom_url}".parameterize
    # custom_url.present? ? "#{id}-#{custom_url}".parameterize : id.to_s
  end
end




