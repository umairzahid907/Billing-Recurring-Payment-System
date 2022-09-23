class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount, null: false
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
