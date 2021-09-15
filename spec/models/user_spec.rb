require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録できる' do 
      it '必要な入力がされている' do
        expect(@user).to be_valid
      end
    end
  end

    context 'ユーザー登録できない' do
      it 'ニックネームが空' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'ニックネームが17文字以上' do
        @user.nickname = "12345678901234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 17 characters)")
      end

      it 'Emailが空' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'Emailに@が含まれない' do
        @user.email = "test-test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it 'emailが被っている' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

      it 'パスワードが空' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満' do
        @user.password = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが21文字以上' do
        @user.password = "12345678901234567890a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 20 characters)")
      end

      it 'パスワードが英字のみ' do
        @user.password ="abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードが数字のみ' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
