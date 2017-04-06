class Template < ApplicationRecord

  #  ------------ Associations ------------
  has_many :invitations, dependent: :destroy

  # ------------ Attachinary validations ------------
  has_attachment :photo
end
