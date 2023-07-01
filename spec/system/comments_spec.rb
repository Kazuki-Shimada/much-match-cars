# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Comments', type: :system do
  describe 'コメントできるとき' do
    it "ログインしているとコメントできる" do
      @user = create(:user)
      @review = create(:review)
      sign_in @user
      visit review_path(@review)
      fill_in "comment[body]", with: "わかります！めっちゃ広いですよね！"
      expect{
          find('input[id="submit"]').click
        }.to change { Comment.count }.by(1)
    end
  end
  
  describe 'コメントできないとき' do
    it "ログインしていないとコメントできない" do
      @review = create(:review)
      visit review_path(@review)
      expect(current_path).to eq guests_guidance_path
    end
  end
end