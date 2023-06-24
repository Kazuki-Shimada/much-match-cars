# frozen_string_literal: true

require "rails_helper"

describe '投稿のテスト' do
  describe 'トップ画面のテスト' do
    before do
      @user = create(:user)
      sign_in @user
      @review = create(:review)
      visit root_path
    end
    context 'トップ画面の表示とリンクの確認' do
      it 'トップ画面にレビュー投稿ページへのリンクが表示されているか' do
        expect(page).to have_link "", href: new_review_path
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end
end
