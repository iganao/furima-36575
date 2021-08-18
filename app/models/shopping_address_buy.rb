class ShoppingAddressBuy
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :buy, :user, :item

  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :house_number
    validates :phone_number
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end