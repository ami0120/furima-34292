require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登路できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
    end
  end
  
    context '新規登録できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'idが1の選択肢を選択すると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'idが1の選択肢を選択すると出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it 'idが1の選択肢を選択すると出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'idが1の選択肢を選択すると出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end
      it 'idが1の選択肢を選択すると出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is Out of setting range")
      end
      it '販売価格は、10,000,000円以上では登録できないこと' do
        @item.price = 200000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is Out of setting range")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number","Price is Out of setting range")
      end
      it '販売価格は半角英数字混合だと登録できないこと' do
        @item.price = '4a30a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number","Price is Out of setting range")
      end
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number","Price is Out of setting range")
      end

    end
  end
end


