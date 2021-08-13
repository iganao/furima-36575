class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, allow_blank: true }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?\d)[A-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
