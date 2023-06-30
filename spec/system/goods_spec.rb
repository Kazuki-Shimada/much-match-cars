# frozen_string_literal: true

require "rails_helper"

RSpec.describe 'Goods', type: :system do
  describe 'goodできるとき' do
    it 'ログインしているとgoodでき、もう一度クリックすると解除される' do
      @user = create(:user)
      @review = create(:review)
      sign_in @user
      visit root_path
      find('#nogood').click
      expect(@review.goods.count).to eq(1)
      find('#good').click
      expect(@review.goods.count).to eq(0)
    end
  end

  describe 'goodできないとき' do
    it 'ログインしていないとgoodできない' do
      @review = create(:review)
      visit root_path
      expect(page).to have_no_link(href: review_goods_path(@review))
    end
  end
end