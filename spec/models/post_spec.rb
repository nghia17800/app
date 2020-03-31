require 'spec_helper'
require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Validates test" do
    it "is not valid without a user_id " do
      post = Post.new(user_id: nil)
      expect(post).to_not be_valid
    end

    it "is not valid without a title " do
      post = Post.new(title: nil)
      expect(post).to_not be_valid
    end

    it "is not valid without a describe " do
      post = Post.new(describe: nil)
      expect(post).to_not be_valid
    end

    it "is not valid without a content " do
      post = Post.new(content: nil)
      expect(post).to_not be_valid
    end
  end

  describe Post do
    it { is_expected.to belong_to(:user) }
  end
end

