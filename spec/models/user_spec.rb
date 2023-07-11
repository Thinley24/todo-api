require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #Association test
  it { should have_many(:tasks).dependent(:destroy) }
  it { should have_many(:sessions).dependent(:destroy) }
  it { should have_one(:user_profiles).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
