# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end

  describe 'tagの登録' do
    context "有効な登録であるとき" do
      it '有効な登録の場合、保存される' do
        expect(@tag).to be_valid
      end
    end

    context "無効な投稿であるとき" do
      it "titleが空だと投稿できずエラーメッセージが表示される" do
        @tag.name = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include("タグ名を入力してください")
      end
    end
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context "model_tagとのアソシエーション" do
      let(:target) { :model_tags }
      it "Model_tagとのアソシエーションはhas_manyである" do
        expect(association.macro).to eq :has_many
        expect(association.class_name).to eq 'ModelTag'
      end
    end
  end
end
