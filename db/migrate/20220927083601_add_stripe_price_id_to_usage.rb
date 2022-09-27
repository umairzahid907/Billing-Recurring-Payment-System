# frozen_string_literal: true

class AddStripePriceIdToUsage < ActiveRecord::Migration[5.2]
  def change
    add_column :usages, :stripe_price_id, :string, default: :null
  end
end
