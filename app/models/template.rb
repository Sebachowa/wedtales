class Template < ApplicationRecord

  #  ------------ Associations ------------
  has_many :invitations

  # ------------ Attachinary validations ------------
  has_attachment :photo
end
