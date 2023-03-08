class AccountTransaction < ApplicationRecord
  belongs_to :bank_account
  belongs_to :user

  attr_accessor :source_account

  enum kind: { deposit: 0, withdraw: 1, reversal: 2, transfer: 3 }

  validates_presence_of :transaction_value, :kind, :bank_account, :user
end
