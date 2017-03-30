class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :template
  has_attachment  :og_photo, accept: [:jpg, :png, :gif]
  has_attachment  :groom_photo, accept: [:jpg, :png, :gif]
  has_attachment  :bride_photo, accept: [:jpg, :png, :gif]
  has_attachments :gallery, maximum: 4
  before_validation :check_if_still_a_draft?
  before_validation :remove_empty_strings
  validates :draft, presence: true

  def to_param
    custom_url.nil? ? id.to_s : "#{id}-#{custom_url}".parameterize
    # custom_url.present? ? "#{id}-#{custom_url}".parameterize : id.to_s
  end

  # check the form
  def check_if_still_a_draft?
    # puts "HELLO! IM GOING TO CHECK IF YOU ARE STILL A DRAFT"
    # if everything is there
    if groom_name.present? && bride_name.present? && location.present? && date.present?
      self.draft = false
    else
      self.draft = true
    end
  end

  # debug the form || for show view
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
