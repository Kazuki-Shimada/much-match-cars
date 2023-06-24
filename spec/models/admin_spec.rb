# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin, type: :model do
  before do
    @admin = FactoryBot.build(:admin)
  end

  describe '管理者新規登録' do
    context '新規登録がうまくいくとき' do
      it "emailとpasswordとpassword_confirmationが存在する" do
        expect(@admin).to be_valid
      end
      it "emailは全て小文字で保存される" do
        @admin.email = 'SAMPLE@SAMPLE.JP'
        @admin.save!
        expect(@admin.reload.email).to eq 'sample@sample.jp'
      end
    end

    context '新規登録がうまくいかないとき' do
      it "emailが空だと登録できず、エラーメッセージが表示される" do
        @admin.email = nil
        @admin.valid?
        expect(@admin.errors[:admin]).to include("")
      end
      it "emailがすでに存在していると登録できず、エラーメッセージが表示される" do
        @admin.save
        another_user = FactoryBot.build(:admin)
        another_user.email = @admin.email
        another_user.valid?
        expect(another_user.errors[:admin]).to include("")
      end
      it "passwordが空だと登録できず、エラーメッセージが表示される" do
        @admin.password = nil
        @admin.valid?
        expect(@admin.errors[:admin]).to include("")
      end
      it "passwordが5文字以下だと登録できず、エラーメッセージが表示される" do
        @admin.password = "00000"
        @@admin.password_confirmation = "00000"
        @admin.valid?
        expect(@admin.errors[:admin]).to include("")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @admin.password_confirmation = nil
        @admin.valid?
        expect(@admin.errors.full_messages.to_s).to include("")
      end
    end
  end

  describe 'passwordの検証' do
    it "passwordが暗号化されている" do
      expect(@admin.encrypted_password).to_not eq 'password'
    end
    it "passwordとpassword_confirmationが異なる場合、登録できない" do
      @admin.password = 'password'
      @admin.password_confirmation = 'WrongPassword'
      @admin.valid?
      expect(@admin.errors.full_messages).to include("")
    end
  end

  describe 'フォーマットの検証' do
    it 'メールアドレスが正常なフォーマットの場合、有効である' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @admin.email = valid_address
        expect(@admin).to be_valid
      end
    end
  end
end