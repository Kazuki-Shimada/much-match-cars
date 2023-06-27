# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Users', type: :system do
  describe 'ログイン前'do
    describe 'ユーザー新規登録' do
      before { visit new_user_registration_path }
      context '新規登録がうまくいくとき' do
        it "有効な登録の場合、保存される" do
          fill_in 'user[name]', with: 'sample_user_1'
          fill_in 'user[email]', with: 'user_1@example.com'
          fill_in 'user[password]', with: 'sampleuser'
          fill_in 'user[password_confirmation]', with: 'sampleuser'
          click_button '登録'
          expect(current_path).to eq '/users/1'
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nameが空だと投稿できずエラーメッセージが表示される' do
          fill_in 'user[name]', with: nil
          fill_in 'user[email]', with: 'nilname@example.com'
          fill_in 'user[password]', with: 'nilnameuser'
          fill_in 'user[password_confirmation]', with: 'user[password]'
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'ユーザー名を入力してください'
          expect(current_path).to eq '/user'
        end
        it 'emailが空だと投稿できずエラーメッセージが表示される' do
          fill_in 'user[name]', with: 'nilemail'
          fill_in 'user[email]', with: nil
          fill_in 'user[password]', with: 'nilemailuser'
          fill_in 'user[password_confirmation]', with: 'user[password]'
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'Eメールを入力してください'
          expect(current_path).to eq '/user'
        end
        it "emailがすでに存在していると登録できず、エラーメッセージが表示される" do
          existed_user = FactoryBot.create(:user)
          fill_in 'user[name]', with: 'existemail'
          fill_in 'user[email]', with: existed_user.email
          fill_in 'user[password]', with: 'existemail'
          fill_in 'user[password_confirmation]', with: 'user[password]'
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'Eメールはすでに存在します'
          expect(current_path).to eq '/user'
        end
        it 'passwordが空だと投稿できずエラーメッセージが表示される' do
          fill_in 'user[name]', with: 'nilpassword'
          fill_in 'user[email]', with: 'nilpassword@example.com'
          fill_in 'user[password]', with: nil
          fill_in 'user[password_confirmation]', with: 'user[password]'
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'パスワードを入力してください'
          expect(current_path).to eq '/user'
        end
        it "passwordが5文字以下だと登録できず、エラーメッセージが表示される" do
          fill_in 'user[name]', with: 'invalidpassword'
          fill_in 'user[email]', with: 'invalidpassword@example.com'
          fill_in 'user[password]', with: "00000"
          fill_in 'user[password_confirmation]', with: 'user[password]'
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'
          expect(current_path).to eq '/user'
        end
        it "passwordが存在してもpassword_confirmationが空だと登録できない" do
          fill_in 'user[name]', with: 'nilconfirmation'
          fill_in 'user[email]', with: 'nilconfirmation@example.com'
          fill_in 'user[password]', with: "nilconfirmation"
          fill_in 'user[password_confirmation]', with: nil
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
          expect(current_path).to eq '/user'
        end
        it "passwordとpassword_confirmationが異なる場合、登録できない" do
          fill_in 'user[name]', with: 'differentpassword'
          fill_in 'user[email]', with: 'differentpassword@example.com'
          fill_in 'user[password]', with: "000000"
          fill_in 'user[password_confirmation]', with: "111111"
          click_button '登録'
          expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
          expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
          expect(current_path).to eq '/user'
        end
      end
    end
  end

  describe 'ログイン後' do
    let(:user) { FactoryBot.create(:user) }
    before do
      login(user)
    end
    describe 'ユーザー編集' do
      before do
        visit edit_user_path(user)
      end
      context '編集がうまくいくとき' do
        it '有効な編集の場合、保存される' do
          fill_in 'user[name]', with: '山田　山男'
          fill_in 'user[introduct]', with: 'edit introduct sample'
          attach_file 'user[profile_image]', "#{Rails.root}/spec/fixtures/sample-user1.jpg"
          click_button '確定'
          expect(current_path).to eq user_path(user)
        end
      end

      context '編集がうまくいかないとき' do
        it 'nameが空だと登録できず、エラーメッセージが表示される' do
          fill_in 'user[name]', with: ''
          click_button '確定'
          expect(current_path).to eq user_path(user)
          expect(page).to have_content("ユーザー名を入力してください")
        end
      end
    end

    describe '退会機能' do
      it "退会を確定するとログインできなくなる" do
        visit edit_user_path(user)
        click_link '退会する'
        expect(current_path).to eq users_confirm_path
        click_link '退会する'
        reset_session!
        expect(user.reload.is_deleted).to eq true
        expect(current_path).to eq new_session_path
        fill_in 'user[email]', with: 'user[email]'
        fill_in 'user[password]', with: 'user[password]'
        expect(current_path).to eq new_session_path
        expect(current_user.id).to eq nil
      end
    end
  end
end