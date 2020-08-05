require 'rails_helper'

describe Comment do
  describe '#create' do
    it "is invalid without a text" do
      user = build(:comment, text: "")
      user.valid?
      expect(user.errors[:text]).to include("を入力してください")
    end
    it "is invalid without a product_id " do
      user = build(:comment, product_id: "")
      user.valid?
      expect(user.errors[:product_id]).to include()
    end
    it "is invalid without a user_id" do
      user = build(:comment, user_id: "")
      user.valid?
      expect(user.errors[:user_id]).to include()
    end
  end
end
