class UserProfile < ApplicationRecord
  # model association
  belongs_to :user

  # validations
  validates :full_name, :address, :phone_number, presence: true
end
