require 'rails_helper'

RSpec.describe BankAgency, type: :model do
  describe 'Relations' do
    it { is_expected.to(have_many(:bank_accounts)) }
  end

  describe 'Validations' do
    it { is_expected.to(validate_presence_of(:agency_number)) }
    it { is_expected.to(validate_presence_of(:address)) }
  end
end
