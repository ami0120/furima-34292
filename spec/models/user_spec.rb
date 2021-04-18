require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe  'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end   
      it 'すでに登録したemailが同じでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'encrypted_passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'encrypted_passwordが半角英数でないと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'encrypted_passwordが6文字以上でないと登録できない' do
        @user.password = '12aa'
        @user.password_confirmation = '12aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'encrypted_passwordがpassword_confirmationと一致しないと登録できない' do
        @user.password_confirmation = 'test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name ='Jackson'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name ='Michael'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_rubyが空では登録できない' do
        @user.first_ruby=''
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby can't be blank")
      end
      it 'first_rubyが全角カタカナでないと登録できない' do
        @user.first_ruby='じゃくそん'
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby Full-width characters")
      end
      it 'last_rubyが空では登録できない' do
        @user.last_ruby=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby can't be blank")
      end
      it 'last_rubyが全角カタカナでないと登録できない' do
        @user.last_ruby='まいける'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby Full-width characters")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end



  end
end
