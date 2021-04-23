class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :listing
  has_one    :delivery
end
