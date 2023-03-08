require 'rails_helper'

RSpec.describe TransactionService do
  before do
    bank_agency = create(:bank_agency)
    @bank_account = create(:bank_account, bank_agency:)
    @account_transaction = create(:account_transaction, bank_account: @bank_account)
    @account_high_transaction = create(:account_transaction, bank_account: @bank_account, transaction_value: 1_000_000)
  end

  let(:transaction_service) { TransactionService.new }

  describe '#update_account_balance' do
    context 'Should change BankAccount object' do
      it 'Should change account_balance after creation' do
        expect { transaction_service.update_account_balance(@account_transaction) 

          @bank_account.reload
        }.to change { @bank_account.account_balance }.by( @bank_account.account_balance + @account_transaction.transaction_value )
      end
    end
  end

  describe '#allow_transaction' do
    it 'transaction value <= limit' do
      expect(transaction_service.allow_transaction(@account_transaction)).to be_truthy
    end

    it 'transaction value > limit' do
      expect(transaction_service.allow_transaction(@account_high_transaction)).to be_falsy
    end
  end
end
