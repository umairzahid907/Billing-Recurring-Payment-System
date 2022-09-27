# frozen_string_literal: true

class AddStripeCustomerIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_customer_id, :string, default: :null
  end
end
