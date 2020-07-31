require 'rails_helper'

describe Product do
  describe '#create' do
    context 'can not save' do
      it "is invalid with a name" do
        product = build(:product, name: "")
        product.valid?
        expect(product.errors[:name]).to include("を入力してください")
      end

      it "is invalid with a discribe" do
        product = build(:product, discribe: "")
        product.valid?
        expect(product.errors[:discribe]).to include("を入力してください")
      end

      it "is invalid with a status" do
        product = build(:product, status: "")
        product.valid?
        expect(product.errors[:status]).to include("を入力してください")
      end

      it "is invalid with a price" do
        product = build(:product, price: "")
        product.valid?
        expect(product.errors[:price]).to include("を300円から9999999円までの間で入力してください")
      end

      it "is invalid with a shipping_cost" do
        product = build(:product, shipping_cost: "")
        product.valid?
        expect(product.errors[:shipping_cost]).to include("を入力してください")
      end

      it "is invalid with a shipping_from" do
        product = build(:product, shipping_from: "")
        product.valid?
        expect(product.errors[:shipping_from]).to include("を入力してください")
      end

      it "is invalid with a days" do
        product = build(:product, days: "")
        product.valid?
        expect(product.errors[:days]).to include("を入力してください")
      end

      it "is invalid with a name that has more than 41 characters " do
        product = build(:product, name: over_word=41.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
        product.valid?
        expect(product.errors[:name]).to include("は40文字以内で入力してください")
      end

      it "is invalid with a discribe that has more than 1001 characters " do
        product = build(:product, discribe: over_word=1001.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
        product.valid?
        expect(product.errors[:discribe]).to include("は1000文字以内で入力してください")
      end

      it "is invalid with a price is less than 300 yen" do
        product = build(:product, price: 299)
        product.valid?
        expect(product.errors[:price]).to include("を300円から9999999円までの間で入力してください")
      end

      it "is invalid with a price that has more than 10000000 yen" do
        product = build(:product, price: 10000000)
        product.valid?
        expect(product.errors[:price]).to include("を300円から9999999円までの間で入力してください")
      end
    end
  end
end