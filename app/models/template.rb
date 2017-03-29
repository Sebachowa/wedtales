class Template < ApplicationRecord
  has_attachment :photo
  has_many :invitations
end
