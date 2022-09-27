# frozen_string_literal: true

class AddStripePriceIdToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :stripe_price_id, :string, default: :null
  end
end
