FactoryBot.define do
  factory :bank_account do
    account_number { "MyString" }
    transaction_limit { 1 }
    bank_agency
  end
end
