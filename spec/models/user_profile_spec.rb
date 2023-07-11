require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # Association test
  it { should belong_to(:user) }

  # Validation tests
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone_number) }
end
