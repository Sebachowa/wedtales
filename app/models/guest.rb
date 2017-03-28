class Guest < ApplicationRecord
  belongs_to :invitation

  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :plus, presence: true
end
