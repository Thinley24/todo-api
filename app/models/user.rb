class User < ApplicationRecord

    # encrypt password - macro service
    has_secure_password

    # model association
    has_many :tasks, class_name: 'Task', dependent: :destroy, foreign_key: :created_by
    has_many :sessions, dependent: :destroy
    has_one :user_profile, dependent: :destroy

    
    # validations
    validates :name, :email, :password_digest, presence: true

    # nested attributes
    accepts_nested_attributes_for :user_profile, update_only: true
end
