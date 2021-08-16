class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shopping_date_id

  validates :image, :product_name, :description, :category_id, :condition_id, :postage_id, :region_id, :shopping_date_id, :price, :user, presence: true

  validates :category_id, :condition_id, :postage_id, :region_id, :shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { less_than_or_equal_to: 9999999, 
    greater_than_or_equal_to: 300 }, format: { with: /\A[0-9]+\z/ }
end
