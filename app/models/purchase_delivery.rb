class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :listing_id, :token, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :listing_id
    validates :token
    validates :postal_code,    format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality:{other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number,   format:{with: /\A[0-9]+\z/}, numericality:{only_integer: true}
  end

  def save
    purchase = Purchase.create(user_id: user_id, listing_id: listing_id)
    Delivery.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
  end
end
