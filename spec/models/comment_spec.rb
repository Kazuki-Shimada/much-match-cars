# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  
  describe 'commentの投稿' do
    context "有効な投稿であるとき" do
      it '有効な投稿の場合、保存される' do
        expect(@comment).to be_valid
      end
    end
    
    context "無効な投稿であるとき" do
      it 'bodyが空だと投稿できずにエラーメッセージが表示される' do
        @comment.body = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Bodyを入力してください")
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
    
    context "Reviewとのアソシエーション" do
      let(:target) { :review }
      it "Userとのアソシエーションはbelongs_toである" do
        expect(association.macro).to eq :belongs_to
        expect(association.class_name).to eq 'Review'
      end
    end
  end
end