class Task < ApplicationRecord
  # model association
  belongs_to :user, class_name: 'User'

  # validations
  validates :title, :due_date, :status, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true
end
