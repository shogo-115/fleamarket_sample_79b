require 'rails_helper'

describe Image do
  describe '#new' do
    context 'can be saved' do
      it "is valid with a image" do
        image = build(:image)
        expect(image).to be_valid
      end
    end
    
    context 'can not save' do
      it "is invalid with a image" do
        image = build(:image, src: "")
        image.valid?
        expect(image.errors[:image]).to include("")
      end
    end
  end
end
