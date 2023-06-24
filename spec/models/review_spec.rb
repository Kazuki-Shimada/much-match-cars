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
      it "designが空だと投稿できず、エラーメッセージが表示される" do
        @review.design = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("デザインを入力してください")
      end
      it "driving_performanceが空だと投稿できず、エラーメッセージが表示される" do
        @review.driving_performance = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("運転性能を入力してください")
      end
      it "costが空だと投稿できず、エラーメッセージが表示される" do
        @review.cost = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("価格を入力してください")
      end
      it "sizeが空だと投稿できず、エラーメッセージが表示される" do
        @review.size = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("広さを入力してください")
      end
      it "safetyが空だと投稿できず、エラーメッセージが表示される" do
        @review.safety = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("安全性能を入力してください")
      end
    end
  end
  
  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context "Userとのアソシエーション" do
      let(:target) { :user }
      it "Userとのアソシエーションはbelongs_toである" do
        expect(association.macro).to eq :belongs_to
        expect(association.class_name).to eq 'User'
      end
    end
    
    context "Typeとのアソシエーション" do
      let(:target) { :type }
      it "Typeとのアソシエーションはbelongs_toである" do
        expect(association.macro).to eq :belongs_to
        expect(association.class_name).to eq 'Type'
      end
    end
    
    context "Goodとのアソシエーション" do
      let(:target) { :goods }
      it "Goodとのアソシエーションはhas_manyである" do
        expect(association.macro).to eq :has_many
        expect(association.class_name).to eq 'Good'
      end
    end
    
    context "Commentとのアソシエーション" do
      let(:target) { :comments }
      it "Commentとのアソシエーションはhas_manyである" do
        expect(association.macro).to eq :has_many
        expect(association.class_name).to eq 'Comment'
      end
    end
  end
end