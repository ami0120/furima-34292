require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @shopping_address = FactoryBot.build(:shopping_address,item_id: @item.id,user_id: @user.id) 
      sleep 0.1
    end
  
  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@shopping_address).to be_valid
      end
      it '建物名がなくても登録できる' do
        @shopping_address.building_name = ''
        expect(@shopping_address).to be_valid
      end
    end
  
    context '新規購入できないとき' do
      it '郵便番号が必須であること' do
        @shopping_address.postal_code = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号の保存にはハイフンが必要であること' do
        @shopping_address.postal_code = '1234567'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が必須であること' do
        @shopping_address.prefecture_id = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が1以外であること' do
        @shopping_address.prefecture_id = 1
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が必須であること' do
        @shopping_address.municipality = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須であること' do
        @shopping_address.address = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @shopping_address.phone_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数値のみ保存可能なこと' do
        @shopping_address.phone_number = '090あ'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number is not a number")
      end
      it '12桁以上では登録できないこと' do
        @shopping_address.phone_number ='123456789012'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
       end
      it 'tokenが空では登録できないこと' do
        @shopping_address.token = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Token can't be blank") 
       end
       it 'item_idが空では登録できないこと' do
        @shopping_address.item_id = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Item can't be blank") 
       end
       it 'user_idが空では登録できないこと' do
        @shopping_address.user_id = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("User can't be blank") 
       end
    end
  end
end