class Listing < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_burden_id
      validates :prefectures_id
      validates :shipping_days_id
    end
  end

  belongs_to       :user
  has_one_attached :image
  has_one          :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :prefectures
  belongs_to :shipping_days
end
