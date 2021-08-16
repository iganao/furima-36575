FactoryBot.define do
  factory :item do
    product_name              { 'テスト' }
    description                 { 'テスト' }
    category_id              { '2' }
    condition_id          { '2' }
    postage_id             { '2' }
    region_id            { '2' }
    shopping_date_id        { '2' }
    price                  {'3000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-test-image.png'), filename: 'furima-test-image.png')
    end

  end
end
