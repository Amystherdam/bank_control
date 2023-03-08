FactoryBot.define do
  factory :bank_account do
    account_number { "000000" }
    transaction_limit { 100000 }
    account_balance { 0 }
    bank_agency
  end
end
