class ShoppingAddressBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :buy, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :municipalities
    validates :house_number
    validates :token
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }

  POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/
  validates :postal_code, presence: true, format: { with: POSTAL_CODE_REGEX, allow_blank: true }

  PHONE_NUMBER_REGEX = /\A(0{1}\d{9,10})\z/
  validates :phone_number, presence: true, format: { with: PHONE_NUMBER_REGEX, allow_blank: true }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                           house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
