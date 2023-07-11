class Session < ApplicationRecord
  # model association 
  belongs_to :user

  # validations
  validate_presence_of :token, :login_attempts, :expires_at, :status
end
