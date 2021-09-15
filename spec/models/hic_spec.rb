require 'rails_helper'

RSpec.describe Hic, type: :model do
  before do
    @hic = FactoryBot.build(:hic)
  end

  describe '俳句の投稿' do
    context '俳句の投稿が可能' do
      it '必要情報が入力されている' do
        expect(@hic).to be_valid
      end
    end

    context '俳句の投稿が不可能' do
      it '俳句の入力がない' do
        @hic.hic = ""
        @hic.valid?
        expect(@hic.errors.full_messages).to include("Hic can't be blank")
      end

      it '俳句の文字数が30文字を超える' do
        @hic.hic = "123456789012345678901234567890a"
        @hic.valid?
        expect(@hic.errors.full_messages).to include("Hic is too long (maximum is 30 characters)")
      end

      it '季語の入力がない' do
        @hic.kigo = ""
        @hic.valid?
        expect(@hic.errors.full_messages).to include("Kigo can't be blank")
      end

      it '季語の文字数が17文字を超える' do
        @hic.kigo = "12345678901234567890"
        @hic.valid?
        expect(@hic.errors.full_messages).to include("Kigo is too long (maximum is 17 characters)")
      end
    end
  end
end
