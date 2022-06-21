FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials }
    description       { Faker::Lorem.sentence }
    category_id       { 2 }
    item_status_id      { 2 }
    shipping_cost_id  { 2 }
    prefecture_id     { 2 }
    shipping_date_id  { 2 }
    price             { 300 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/app-store.svg'), filename: 'test_image.png')
    end
  end
end
