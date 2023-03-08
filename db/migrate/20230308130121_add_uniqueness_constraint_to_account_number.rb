class AddUniquenessConstraintToAccountNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :bank_accounts, :account_number, unique: true
  end
end
