require 'rails_helper'

RSpec.describe BankAgency, type: :model do
  describe 'Validations' do
    it { is_expected.to(validate_presence_of(:agency_number)) }
    it { is_expected.to(validate_presence_of(:address)) }
  end
end
