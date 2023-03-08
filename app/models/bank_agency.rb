class BankAgency < ApplicationRecord
  has_many :bank_accounts

  validates_presence_of :agency_number, :address
end
