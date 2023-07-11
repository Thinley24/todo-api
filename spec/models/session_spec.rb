require 'rails_helper'

RSpec.describe Session, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # Association test
  it { should belong_to(:user) }

  # Validation tests
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:login_attempts) }
  it { should validate_presence_of(:expires_at) }
  it { should validate_presence_of(:status) }
end
