require 'rails_helper'
describe Address do
  describe '#create' do
    it "is invalid without a postNo" do
      user = build(:address, postNo: "")
      user.valid?
      expect(user.errors[:postNo]).to include("can't be blank")
    end

    it "is invalid without a pref" do
      user = build(:address, pref: "")
      user.valid?
      expect(user.errors[:pref]).to include("can't be blank")
    end

    it "is invalid without a city" do
      user = build(:address, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a block" do
      user = build(:address, block: "")
      user.valid?
      expect(user.errors[:block]).to include("can't be blank")
    end

    it "is valid without a building " do
      user = build(:address, building: "")
      expect(user).to be_valid
    end

    it "is invalid without a family_name" do
      user = build(:address, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      user = build(:address, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_f" do
      user = build(:address, family_name_f: "")
      user.valid?
      expect(user.errors[:family_name_f]).to include("can't be blank")
    end

    it "is invalid without a first_name_f" do
      user = build(:address, first_name_f: "")
      user.valid?
      expect(user.errors[:first_name_f]).to include("can't be blank")
    end
    
    it "is valid without a phon " do
      user = build(:address, phon: "")
      expect(user).to be_valid
    end

  end
end





