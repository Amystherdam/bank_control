user = User.create!(
  email: Faker::Internet.email, 
  password: '12345678'
)

bank_agency = BankAgency.create!(
  agency_number: Faker::Number.number(digits: 4), 
  address: Faker::Address.street_address
)

4.times do |i|
  # create variety in the database
  variable_name = "@bank_account_#{i}"

  instance_variable_set(variable_name, BankAccount.create!(
    account_number: Faker::Bank.account_number, 
    transaction_limit: Faker::Number.number(digits: 6),
    bank_agency:
  ))
end

6.times do |i|
  # create variety in the database
  i < 4 ? variable_name = "@bank_account_#{i}" : variable_name = "@bank_account_1" 

  account_transaction = AccountTransaction.create!(
    transaction_value: Faker::Number.number(digits: 6),
    kind: :deposit, 
    bank_account: instance_variable_get(variable_name),
    user:
  )

  transaction_service = TransactionService.new
  transaction_service.update_account_balance(
    account_transaction.kind, 
    account_transaction.transaction_value, 
    account_transaction.bank_account_id
  )
end
