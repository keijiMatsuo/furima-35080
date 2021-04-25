
FactoryBot.define do
  factory :purchase_delivery do
    token          {'tok_abcdefghijk00000000000000000'}
    postal_code    { '123-4567' }
    prefectures_id { 2 }
    municipality   { '日本市日本町' }
    address        { '日本1-2-3' }
    building_name  { '日の本ビル' }
    phone_number   { '09012345678' }
  end
end
