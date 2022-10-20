RSpec.describe Friendship, type: :model do
  subject { build(:friendship) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }
end