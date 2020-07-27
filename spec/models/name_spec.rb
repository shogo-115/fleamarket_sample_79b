require 'rails_helper'
describe Name do
  describe '#create_name' do
    it "is invalid without a family_name" do
      user = build(:name, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name " do
      user = build(:name, first_name: "")
      user.valid?
      expect(user.errors[:first_name ]).to include("can't be blank")
    end

    it "is invalid without a family_name_f " do
      user = build(:name, family_name_f: "")
      user.valid?
      expect(user.errors[:family_name_f ]).to include("can't be blank")
    end

    it "is invalid without a first_name_f " do
      user = build(:name, first_name_f: "")
      user.valid?
      expect(user.errors[:first_name_f ]).to include("can't be blank")
    end

    it "is invalid without a birthday " do
      user = build(:name, birthday: "")
      user.valid?
      expect(user.errors[:birthday ]).to include("can't be blank")
    end

    #姓に半角数字が入った場合、保存できない
    it "is invalid family_name include HANKAKUSUUZI" do
      user = build(:name, family_name: "1山田")
      user.valid?
      expect(user.errors[:family_name]).to include("全角文字のみが使えます")
    end

    #姓に半角英語が入った場合、保存できない
    it "is invalid family_name include HANKAKUEIGO" do
      user = build(:name, family_name: "a山田")
      user.valid?
      expect(user.errors[:family_name]).to include("全角文字のみが使えます")
    end

    #名に半角数字が入った場合、保存できない
    it "is invalid family_name include HANKAKUSUUZI" do
      user = build(:name, first_name: "1太郎")
      user.valid?
      expect(user.errors[:first_name]).to include("全角文字のみが使えます")
    end

    #名に半角英語が入った場合、保存できない
    it "is invalid first_name include HANKAKUEIGO" do
      user = build(:name, first_name: "a太郎")
      user.valid?
      expect(user.errors[:first_name]).to include("全角文字のみが使えます")
    end

    #振り仮名姓に半角数字が入った場合、保存できない
    it "is invalid family_name_f include HANKAKUSUJI" do
      user = build(:name, family_name_f: "1ヤマダ")
      user.valid?
      expect(user.errors[:family_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に半角英語が入った場合、保存できない
    it "is invalid family_name_f include HANKAKUEIGO" do
      user = build(:name, family_name_f: "aヤマダ")
      user.valid?
      expect(user.errors[:family_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に平仮名が入った場合、保存できない
    it "is invalid family_name_f include HIRAGANA" do
      user = build(:name, family_name_f: "やマダ")
      user.valid?
      expect(user.errors[:family_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に漢字が入った場合、保存できない
    it "is invalid family_name_f include KANJI" do
      user = build(:name, family_name_f: "山ダ")
      user.valid?
      expect(user.errors[:family_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名 名に半角数字が入った場合、保存できない
    it "is invalid first_name_f include HANKAKUSUJI" do
      user = build(:name, first_name_f: "1タロウ")
      user.valid?
      expect(user.errors[:first_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に半角英語が入った場合、保存できない
    it "is invalid first_name_f include HANKAKUEIGO" do
      user = build(:name, first_name_f: "aタロウ")
      user.valid?
      expect(user.errors[:first_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に平仮名が入った場合、保存できない
    it "is invalid first_name_f include HIRAGANA" do
      user = build(:name, first_name_f: "たロウ")
      user.valid?
      expect(user.errors[:first_name_f]).to include("全角カタカナのみが使えます")
    end

    #振り仮名姓に漢字が入った場合、保存できない
    it "is invalid first_name_f include KANJI" do
      user = build(:name, first_name_f: "太ロウ")
      user.valid?
      expect(user.errors[:first_name_f]).to include("全角カタカナのみが使えます")
    end

  end
end
