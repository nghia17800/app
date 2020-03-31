require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  context "Validates test" do
    it "is not valid without a name " do
      user = User.new(name: nil).save
      expect(user).to eq(false)
    end

    it "is not valid without a email " do
      user = User.new(email: nil).save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(name: "Name", email: "lvn172800@gmail.com", password: "1234").save
      expect(user).to eq(true)
    end
  end

  describe User do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
  end

end
