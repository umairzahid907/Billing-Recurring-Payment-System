class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
    add_index :subscriptions, [:user_id, :plan_id], unique: true
  end
end
