class BankAccount < ApplicationRecord
  belongs_to :bank_agency

  validates_presence_of :account_number, :transaction_limit, :bank_agency
end
