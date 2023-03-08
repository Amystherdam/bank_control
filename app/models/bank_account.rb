class BankAccount < ApplicationRecord
  belongs_to :bank_agency
  has_many :account_transactions

  attr_accessor :agency_number

  validates_presence_of :account_number, :transaction_limit, :bank_agency
  validates :account_number, uniqueness: true
end
