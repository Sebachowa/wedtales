class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :template
  has_attachment :photo, maximum: 4
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
end



