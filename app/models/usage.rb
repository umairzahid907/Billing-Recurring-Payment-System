class Usage < ApplicationRecord
  belongs_to :feature
  belongs_to :subscription
end
