require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create!(name: 'Name', email: 'lvn17800@gmail.com', password: '123')
  end

  it "login in" do
    visit login_path
    within('form') do
      fill_in 'Email', with: 'lvn17800@gmail.com'
      fill_in 'Password', with: '123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Login Success!'
  end

  it "Missing Email" do
    visit login_path
    within('form') do
      fill_in 'Password', with: '123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid email/password combination'
  end

  it "Missing Password" do
    visit login_path
    within('form') do
      fill_in 'Email', with: 'lvn17800@gmail.com'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid email/password combination'
  end

  it "log out" do
    visit login_path
    within('form') do
      fill_in 'Email', with: 'lvn17800@gmail.com'
      fill_in 'Password', with: '123'
    end
    click_button 'Log in'
    click_link "Log out"
    expect(page).to have_content 'Log out Success!'
  end
end
