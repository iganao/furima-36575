FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '一郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'イチロウ' }
    birthday              { '2000-12-12' }
  end
end
