require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '商品出品できるとき'
    it '全ての項目の入力が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it 'product_nameがない場合は登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it 'descriptionがない場合は登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idがない場合は登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idがない場合は登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'postage_idがない場合は登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end

    it 'region_idがない場合は登録できない' do
      @item.region_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end

    it 'shopping_date_idがない場合は登録できない' do
      @item.shopping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping date can't be blank")
    end

    it 'priceがない場合は登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'imageがない場合は登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'product_nameが41文字以上の場合は登録できない' do
      @item.product_name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
    end

    it 'descriptionが1000文字以上の場合は登録できない' do
      @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
    end

    it 'priceが300以下の場合は登録できない' do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9999999以上の場合は登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end