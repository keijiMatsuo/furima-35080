FactoryBot.define do
  factory :listing do
    after(:build) do |listing|
      listing.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    product_name       { 'テスト' }
    description        { 'ご覧頂きありがとうございます。' }
    category_id        { 2 }
    status_id          { 2 }
    shipping_burden_id { 2 }
    prefectures_id     { 8 }
    shipping_days_id   { 3 }
    price              { 2000 }

    association :user
  end
end
