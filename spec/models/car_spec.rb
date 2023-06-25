# frozen_string_literal: true

require "rails_helper"

RSpec.describe Car, type: :model do
  before do
    @Car = FactoryBot.build(:car)
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context "Userとのアソシエーション" do
      let(:target) { :user }
      it "Userとのアソシエーションはbelongs_toである" do
        expect(association.macro).to eq :belongs_to
        expect(association.class_name).to eq 'User'
      end
    end
  end
end