require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relations' do
    it { is_expected.to(have_many(:account_transactions)) }
  end
end
