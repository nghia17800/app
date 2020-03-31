require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  before :each do
    User.create!(name: 'Name', email: 'lvn17800@gmail.com', password: '123')
    visit login_path
    within('form') do
      fill_in 'Email', with: 'lvn17800@gmail.com'
      fill_in 'Password', with: '123'
    end
    click_button 'Log in'
  end

  it "create new posts suceess" do
    visit root_path
    within('form') do
      fill_in 'Title', with: 'khoa hoc'
      fill_in 'Describe', with: 'online'
      fill_in 'Content', with: 'Ruby On Rails'
    end
    click_button 'Create post'
    expect(page).to have_content 'Wait for actived!'
  end

  it "destroy user" do
    visit root_path
      within('form') do
        fill_in 'Title', with: 'khoa hoc'
        fill_in 'Describe', with: 'online'
        fill_in 'Content', with: 'Ruby On Rails'
    end
    click_button 'Create post'
    click_link 'view my profile'
    expect{ click_link 'delete'}.to change(Post, :count).by(-1)
    expect(page).to have_content 'Micropost deleted'
  end
end
