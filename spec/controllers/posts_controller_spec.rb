require 'rails_helper'

describe PostsController, type: :controller do
  context "with valid attributes" do
    it "creates a new post" do
      expect{
        post = FactoryBot.create(:post)
      }.to change(Post,:count).by(1)
    end
  end

  context "with invalid attributes" do
    it "does not save the new post" do
      expect{
        post = Post.new(title: nil)
      }.to_not change(Post,:count)
    end
  end

  context 'DELETE destroy' do
    it "deletes the post" do
      post = FactoryBot.create(:post)
      expect{
        delete :destroy, params: { id: post.to_param }
      }.to change(Post,:count).by(-1)
    end
  end
end
