class Guest < ApplicationRecord

  # ------------ Associations ------------
  belongs_to :invitation

  # ------------ Attachinary validations ------------
  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :plus, presence: true
end
