# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Comments', type: :system do
  before do
    @review = create(:review)
    @user = create(:user)
  end
  describe 'コメント投稿機能' do
    context 'コメントできるとき' do
      it "ログインしているとコメントできる" do
        sign_in @user
        visit review_path(@review)
        fill_in "comment[body]", with: "わかります！めっちゃ広いですよね！"
        expect{
            find('input[id="submit"]').click
          }.to change { Comment.count }.by(1)
      end
    end

    context 'コメントできないとき' do
      it "ログインしていないとコメントできない" do
        visit review_path(@review)
        expect(current_path).to eq guests_guidance_path
      end
    end
  end

  describe 'コメント削除機能' do
    before do
      @comment = create(:comment)
    end
    context "コメントを削除できる時" do
      it "コメント主はコメントを削除できる" do
        sign_in (@comment.user)
        visit review_path(@comment.review)
        expect(current_path).to eq review_path(@comment.review)
        expect{
          click_on '削除'
        }.to change { Comment.count }.by(-1)
        expect(page).to have_content 'コメントを削除しました'
        expect(page).to have_no_content("#{@comment.body}")
      end
      it "管理者はコメントを削除できる" do
        @admin = create(:admin)
        sign_in @admin
        visit admin_review_path(@comment.review)
        expect(current_path).to eq admin_review_path(@comment.review)
        expect{
          click_on '削除'
        }.to change { Comment.count }.by(-1)
        expect(page).to have_content 'コメントを削除しました'
        expect(page).to have_no_content("#{@comment.body}")
      end
    end

    context "コメントを削除できない時" do
      it "他のユーザーのコメントは削除できない" do
        @user = create(:user)
        sign_in @user
        visit review_path(@comment.review)
        expect(page).to have_no_content("削除")
      end
    end
  end
end