FactoryBot.define do
  factory :listing do

    after(:build) do |listing|
      listing.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    product_name       {"テスト"}
    description        {"ご覧頂きありがとうございます。"}
    category           {Category.all.sample}
    status             {Status.all.sample}
    shipping_burden    {ShippingBurden.all.sample}
    prefectures        {Prefectures.all.sample}
    shipping_days      {ShippingDays.all.sample}
    price              {2000}

    association :user
  end
end
