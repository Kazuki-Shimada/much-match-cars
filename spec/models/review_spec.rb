# frozen_string_literal: true

require "rails_helper"

describe 'レビューモデルのテスト' do
  it '有効な投稿内容の場合、保存されるか' do
    expect(FactoryBot.build(:review)).to be_valid
  end
end