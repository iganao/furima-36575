require 'rails_helper'

RSpec.describe ShoppingAddressBuy, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shopping_address_buy = FactoryBot.build(:shopping_address_buy, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shopping_address_buy).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @shopping_address_buy.building_name = ''
        expect(@shopping_address_buy).to be_valid
    end
  end


    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @shopping_address_buy.postal_code = ''
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_address_buy.postal_code = '1111111'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが全角のハイフンを含んだ文字だと保存できないこと' do
        @shopping_address_buy.postal_code = '１１１−１１１１'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @shopping_address_buy.prefecture_id = ''
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @shopping_address_buy.municipalities = ''
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      it 'house_numberが空だと保存できないこと' do
        @shopping_address_buy.house_number = ''
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @shopping_address_buy.phone_number = ''
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @shopping_address_buy.phone_number = '０１１１１１１１１１'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが9桁だと保存できないこと' do
        @shopping_address_buy.phone_number = '011111111'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'phone_numberが12桁だと保存できないこと' do
        @shopping_address_buy.phone_number = '011111111111'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberにハイフンが入っていると保存できないこと' do
        @shopping_address_buy.phone_number = '011-1111-1111'
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @shopping_address_buy.token = nil
        @shopping_address_buy.valid?
        expect(@shopping_address_buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
