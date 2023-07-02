# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Admins', type: :system do
  describe '管理者ログイン' do
    before do
      @admin = FactoryBot.create(:admin)
      visit new_admin_session_path
    end
    context 'ログインできるとき' do
      it "有効な内容の場合、ログインできる" do
        fill_in 'admin[email]', with: @admin.email
        fill_in 'admin[password]', with: @admin.password
        click_button 'ログイン'
        expect(current_path).to eq admin_types_path
      end
    end

    context 'ログインできないとき' do
      it "メールアドレスが空の場合ログインできない" do
        fill_in 'admin[password]', with: @admin.password
        click_button 'ログイン'
        expect(page).to have_content "Emailまたはパスワードが違います。"
        expect(current_path).to eq new_admin_session_path
      end
      it "パスワードが空の場合、ログインできない" do
        fill_in 'admin[email]', with: @admin.email
        click_button 'ログイン'
        expect(page).to have_content "Emailまたはパスワードが違います。"
        expect(current_path).to eq new_admin_session_path
      end
    end
  end
end