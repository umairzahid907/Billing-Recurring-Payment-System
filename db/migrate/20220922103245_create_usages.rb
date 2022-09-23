class CreateUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :usages do |t|
      t.references :feature, foreign_key: true
      t.references :subscription, foreign_key: true
      t.integer :units_used, null: false

      t.timestamps
    end
    add_index :usages, [:feature_id, :subscription_id], unique: true
  end
end
