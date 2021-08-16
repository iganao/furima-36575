class Item < ApplicationRecord
  belongs_to :user
  # has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :shopping_date

  with_options presence: true do
    validates :product_name 
    validates :price 
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shopping_date_id
    validates :image
  end
  

  validates :category_id, :condition_id, :postage_id, :region_id, :shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { less_than_or_equal_to: 9999999, 
    greater_than_or_equal_to: 300 }, format: { with: /\A[0-9]+\z/ }
end
