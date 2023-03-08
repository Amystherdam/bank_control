class AddAccountBalanceToBankAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :bank_accounts, :account_balance, :integer, null: false, default: 0
  end
end
