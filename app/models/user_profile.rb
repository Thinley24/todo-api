class UserProfile < ApplicationRecord
  # model association
  belongs_to :user

  # validations
  validate_presence_of :full_name, :address, :phone_number
end
