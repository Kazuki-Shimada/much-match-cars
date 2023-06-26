# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "有効な登録の場合、保存される" do
        expect(@user).to be_valid
      end
      it "emailは全て小文字で保存される" do
        @user.email = 'SAMPLE@SAMPLE.JP'
        @user.save!
        expect(@user.reload.email).to eq 'sample@sample.jp'
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録でず、エラーメッセージが表示される" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it "emailが空だと登録できず、エラーメッセージが表示される" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailがすでに存在していると登録できず、エラーメッセージが表示される" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空だと登録できず、エラーメッセージが表示される" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できず、エラーメッセージが表示される" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages.to_s).to include("")
      end
    end
  end
  
  describe 'passwordの検証' do
    it "passwordが暗号化されている" do
      expect(@user.encrypted_password).to_not eq 'password'
    end
    it "passwordとpassword_confirmationが異なる場合、登録できない" do
      @user.password = 'password'
      @user.password_confirmation = 'WrongPassword'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
  
  describe 'フォーマットの検証' do
    it 'メールアドレスが正常なフォーマットの場合、有効である' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context "Carとのアソシエーション" do
      let(:target) { :cars }
      it "Carとのアソシエーションはhas_manyである" do
        expect(association.macro).to eq :has_many
        expect(association.class_name).to eq 'Car'
      end
    end
    
    context "Reviewとのアソシエーション" do
      let(:target) { :reviews }
      it "Reviewとのアソシエーションはhas_manyである" do
        expect(association.macro).to eq :has_many
        expect(association.class_name).to eq 'Review'
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