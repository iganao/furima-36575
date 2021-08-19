FactoryBot.define do
  factory :shopping_address_buy do
    postal_code { '111-1111' }
    prefecture_id { '2' }
    municipalities { '2' }
    house_number { '2' }
    building_name { '2' }
    phone_number { '0111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
