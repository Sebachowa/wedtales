class Guest < ApplicationRecord
  belongs_to :invitation

  validates :email, presence: true
  validates :phone_number, presence: true
  validates :plus, default: 0, presence: true
end
