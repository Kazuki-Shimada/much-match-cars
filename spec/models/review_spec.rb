# frozen_string_literal: true

require "rails_helper"

describe Review, "モデルに関するテスト", type: :model do
  describe "実際に保存してみる" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:review)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      review = Review.new(title: "", body: "hoge")
      expect(review).to be_invalid
      expect(review.errors[:title]).to include("can't be blank")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      review = Review.new(title: "hoge", body: "")
      expect(review).to be_invalid
      expect(review.errors[:body]).to include("can't be blank")
    end
  end
  feature "titleを空白で投稿した場合に画面にエラーメッセージが表示されているか" do
    before do
      visit reviews_path
      fill_in "review[title]", with: ""
    end
    scenario "エラーメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "can't be blank"
    end
  end
  feature "bodyを空白で投稿した場合に画面にエラーメッセージが表示されているか" do
    before do
      visit reviews_path
      fill_in "book[body]", with: ""favfdfvsvadc
    end
    scenario "エラーメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "can't be blank"
    end
  end
end
