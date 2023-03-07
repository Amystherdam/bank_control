class BankAgency < ApplicationRecord
  validates_presence_of :agency_number, :address
end
