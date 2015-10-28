class CreateCurrencyCodes < ActiveRecord::Migration
  def change
    create_table :currency_codes do |t|
      t.integer :currency_id
      t.integer :country_id
      t.string :currency_code

      t.timestamps null: false
    end
  end
end
