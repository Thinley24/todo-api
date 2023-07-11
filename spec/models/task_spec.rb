require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # Association test
  it { should belong_to(:user) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:description).is_at_most(500).allow_blank }
  it { should validate_presence_of(:due_date) }
  it { should validate_presence_of(:status) }
end
