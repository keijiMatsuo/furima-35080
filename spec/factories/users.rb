FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password + '1A' }
    password_confirmation { password }
    last_name             { '松尾' }
    first_name            { '継士' }
    last_name_kana        { 'マツオ' }
    first_name_kana       { 'ケイジ' }
    birth_day             { Faker::Date.birthday }
  end
end
