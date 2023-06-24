# frozen_string_literal: true

require "rails_helper"

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'reviewの投稿' do
    context "投稿がうまくいくとき" do
      it '有効な投稿内容の場合、保存される' do
        expect(@review).to be_valid
      end
    end

    context "投稿がうまくいかないとき" do
      it "titleが空だと投稿できずエラーメッセージが表示される" do
        @review.title = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("タイトルを入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
      it "rateが空だと投稿できず、エラーメッセージが表示される" do
        @review.rate = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("総評価を入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
      it "bodyが空だと投稿できず、エラーメッセージが表示される" do
        @review.body = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("本文を入力してください")
      end
    end
  end
end