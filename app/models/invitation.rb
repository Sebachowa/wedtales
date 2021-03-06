class Invitation < ApplicationRecord

  # ------------ Associations ------------
  belongs_to :user
  belongs_to :template
  has_many :guests, dependent: :destroy

  # ------------ Attachinary validations ------------
  has_attachment  :og_photo, accept: [:jpg, :png, :gif]
  has_attachment  :groom_photo, accept: [:jpg, :png, :gif]
  has_attachment  :bride_photo, accept: [:jpg, :png, :gif]
  has_attachments :gallery, maximum: 4

  #  ------------ Google MAPS ------------
  geocoded_by :location
  after_validation(:geocode, { if: :location_changed? })

  #  ------------ CallBacks ------------
  before_validation :check_if_still_a_draft?
  before_validation :remove_empty_strings
  # validates :draft, presence: true

  #  ------------ Custom URL ------------
  # def to_param
  #   custom_url.nil? ? id.to_s : "#{id}-#{custom_url}".parameterize
  # end


  # ------------ Checking draft status ------------
  def check_if_still_a_draft?
    if groom_name.present? && bride_name.present? && location.present? && date.present?
      self.draft = false
    else
      self.draft = true
    end
  end
  #  ------------ Cleaning the form ------------
  def remove_empty_strings
    self.og_title = nil             if self.groom_name == ""
    self.og_description = nil       if self.groom_name == ""
    self.groom_name = nil           if self.groom_name == ""
    self.groom_bio = nil            if self.groom_bio == ""
    self.bride_name = nil           if self.bride_name == ""
    self.bride_bio = nil            if self.bride_bio == ""
    self.location = nil             if self.location == ""
    self.date = nil                 if self.location == ""
    self.story_title = nil          if self.story_title == ""
    self.wedding_description = nil  if self.wedding_description == ""
  end
end
