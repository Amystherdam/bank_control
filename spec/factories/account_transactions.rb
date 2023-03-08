FactoryBot.define do
  factory :account_transaction do
    transaction_value { 1000 }
    kind { :deposit }
    bank_account
    destination_bank_account { nil }
    user
  end
end
