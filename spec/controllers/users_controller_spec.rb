require 'rails_helper'

describe UsersController, type: :controller do
  context "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the #show view" do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.to_param }
      expect(response).to render_template :show
    end
  end

  context "with valid attributes" do
    it "creates a new user" do
      expect{
        user = FactoryBot.create(:user)
      }.to change(User, :count).by(1)
    end
  end

  context "with invalid attributes" do
    it "does not save the new user" do
      expect{
        user = User.new(name: nil)
      }.to_not change(User, :count)
    end
  end

end
