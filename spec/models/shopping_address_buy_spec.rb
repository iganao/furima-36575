require 'rails_helper'

RSpec.describe ShoppingAddressBuy, type: :model do
  describe '購入情報の保存' do
  before do
    user = FactoryBot.create(:user)
    @shopping_address_buy = FactoryBot.build(:shopping_address_buy, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'cityは空でも保存できること' do
    end
  end


    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end
    end
  end
end
