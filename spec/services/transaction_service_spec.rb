require 'rails_helper'

RSpec.describe TransactionService do
  before do
    bank_agency = create(:bank_agency)
    @bank_account = create(:bank_account, bank_agency:)
    @account_transaction = create(:account_transaction, bank_account: @bank_account)
  end

  let(:transaction_service) { TransactionService.new }

  describe '#update_account_balance' do
    subject { Vulnerability.first }

    context 'Should change BankAccount object' do
      it 'Should change account_balance after creation' do
        expect { transaction_service.update_account_balance(
          @account_transaction.kind, 
          @account_transaction.transaction_value, 
          @account_transaction.bank_account_id) 

          @bank_account.reload
        }.to change { @bank_account.account_balance }.by( @bank_account.account_balance + @account_transaction.transaction_value )
      end
    end
  end
end
