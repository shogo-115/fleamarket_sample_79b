require 'rails_helper'

describe Card do
  describe '#new' do
    it "is invalid without a user_id" do
      user = build(:card, user_id: "")
      user.valid?
      expect(user.errors[:user_id]).to include()
    end
    it "is invalid without a customer_id" do
      user = build(:card, customer_id: "")
      user.valid?
      expect(user.errors[:customer_id]).to include()
    end
    it "is invalid without a card_id" do
      user = build(:card, card_id: "")
      user.valid?
      expect(user.errors[:card_id]).to include()
    end
  end
end
