# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Reviews', type: :system do
  describe 'レビュー投稿' do
    before do
      @user = create(:user)
      @review = create(:review)
      visit root_path
    end
    context '投稿できるとき' do
      it '有効な投稿の場合、投稿できる' do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        expect{
          find('input[id="submit"]').click
        }.to change { Review.count }.by(1)
        expect(page).to have_content '投稿が成功しました'
        expect(current_path).to eq root_path
      end
    end
    context "投稿できないとき" do
      it 'ログインしていないと投稿できない' do
        visit new_review_path
        expect(current_path).to eq guests_guidance_path
      end
      it "designが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content 'デザインを入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "driving_performanceが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '運転性能を入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "costが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '価格を入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "sizeが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '広さを入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "safetyが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '安全性能を入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "rateが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        fill_in "review[title]", with: "とっても広い！"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '総評価を入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "titleが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[body]", with: "とっても広いくて乗っている人みんなが快適に過ごせる！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content 'タイトルを入力してください'
        expect(current_path).to eq '/reviews'
      end
      it "bodyが空だと投稿できずエラーメッセージが表示される" do
        sign_in @user
        visit new_review_path
        select "5", from: "review[design]"
        select "5", from: "review[driving_performance]"
        select "5", from: "review[cost]"
        select "5", from: "review[size]"
        select "5", from: "review[safety]"
        select "5", from: "review[rate]"
        fill_in "review[title]", with: "とっても広い！"
        attach_file 'review[review_image]', "#{Rails.root}/spec/fixtures/typer.jpg"
        click_button '投稿する'
        expect(page).to have_content '本文を入力してください'
        expect(current_path).to eq '/reviews'
      end
    end
  end
  describe 'レビュー削除' do
    before do
      @review1 = create(:review)
      @review2 = create(:review)
      @admin = create(:admin)
    end
    context "投稿が削除できるとき" do
      it "投稿主は削除できる" do
        sign_in(@review1.user)
        visit root_path
        expect{
          find_button('削除').click
        }.to change { Review.count }.by(-1)
        expect(page).to have_content '投稿を削除しました'
        expect(page).to have_no_content("#{@review1.title}")
      end
      it "管理者は削除できる" do
        sign_in @admin
        visit admin_reviews_path
        expect{
          find_link('削除', href: admin_review_path(@review1)).click
        }.to change { Review.count }.by(-1)
        expect(page).to have_content '投稿を削除しました'
        expect(page).to have_no_content("#{@review1.title}")
      end
    end
    context "投稿が削除できないとき" do
      it "投稿主以外には削除ボタンが表示されない" do
        sign_in(@review1.user)
        visit root_path
        expect(page).to have_no_link '削除', href: review_path(@review2)
      end
      it "ログインしないと削除ボタンが表示されない" do
        visit root_path
        expect(page).to have_no_link('削除'), href: review_path(@review1)
      end
    end
  end
end
