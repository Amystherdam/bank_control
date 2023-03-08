class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number, null: false, default: ''
      t.integer :transaction_limit, null: false, default: 0
      t.references :bank_agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
