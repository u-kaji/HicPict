require 'rails_helper'

RSpec.describe Eval, type: :model do
  before do
    @eval = FactoryBot.build(:eval)
  end

  describe '俳句の品評' do
    context '俳句の品評が可能' do
      it '必要な情報が入力されている' do
        expect(@eval).to be_valid
      end
    end

    context '俳句の品評が不可能' do
      it 'レビューが空' do
        @eval.review = ""
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Review can't be blank")
      end

      it 'レビューが51文字以上' do
        @eval.review = "12345678901234567890123456789012345678901234567890a"
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Review is too long (maximum is 50 characters)")
      end

      it 'sceneが空' do
        @eval.scene = nil
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Scene can't be blank")
      end

      it 'kigoが空' do
        @eval.kigo = nil
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Kigo can't be blank")
      end

      it 'rhythmが空' do
        @eval.rhythm = nil
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Rhythm can't be blank")
      end

      it 'techが空' do
        @eval.tech = nil
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Tech can't be blank")
      end

      it 'originalが空' do
        @eval.original = nil
        @eval.valid?
        expect(@eval.errors.full_messages).to include("Original can't be blank")
      end
    end
  end
end
