class User < ApplicationRecord
    # model association
    has_many :tasks, class_name: 'Task', dependent: :destroy
    has_many :sessions, dependent: :destroy
    has_one :user_profile, dependent: :destroy

    # validations
    validates :name, :email, :password, presence:true
end
