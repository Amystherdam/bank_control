puts "Creating user..."
user = User.create!(
  email: Faker::Internet.email, 
  password: '12345678'
)

puts "Creating bank agency..."
bank_agency = BankAgency.create!(
  agency_number: Faker::Number.number(digits: 4), 
  address: Faker::Address.street_address
)
puts "Bank agency created..."

puts "Creating bank account..."
4.times do |i|
  # create variety in the database
  variable_name = "@bank_account_#{i}"
  
  instance_variable_set(variable_name, BankAccount.create!(
    account_number: Faker::Bank.account_number, 
    transaction_limit: Faker::Number.number(digits: 6),
    bank_agency:
  ))
end
puts "Bank account created..."

puts "Creating account transactions..."
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
  transaction_service.update_account_balance(account_transaction)
end
puts "Account transactions created..."
