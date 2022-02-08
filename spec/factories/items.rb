FactoryBot.define do
  factory :item do
    title                 { 'test' }
    explanation           { 'explanation_test' }
    category_id           { 2 }
    condition_id          { 2 }
    shipment_source_id    { 2 }
    shipping_days_id      { 2 }
    delivery_charge_id    { 2 }
    price                 { '1111' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.png')
    end
  end
end
