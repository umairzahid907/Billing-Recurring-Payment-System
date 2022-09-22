class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name, null: false, limit: 50
      t.integer :unit_price, null: false
      t.integer :max_unit_limit, null: false
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
