class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?\d)[A-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
