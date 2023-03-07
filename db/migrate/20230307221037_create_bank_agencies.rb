class CreateBankAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_agencies do |t|
      t.string :agency_number, null: false, default: ''
      t.string :address, null: false, default: ''

      t.timestamps
    end
  end
end
