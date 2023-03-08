require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  describe 'Relations' do
    it { is_expected.to(belong_to(:bank_agency)) }
  end

  describe 'Validations' do
    it { is_expected.to(validate_presence_of(:account_number)) }
    it { is_expected.to(validate_presence_of(:transaction_limit)) }
    it { is_expected.to(validate_presence_of(:bank_agency)) }
  end
end
