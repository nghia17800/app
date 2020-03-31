require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'sign up' do
    before(:each) do
      visit new_user_path
      within('form') do
        fill_in 'Name', with: 'Jone'
      end
    end

    scenario "should be suceessful" do
      fill_in 'Email',with: 'lvn1782003@gmail.com'
      fill_in 'Password', with: '132'
      fill_in 'Confirmation', with: '132'
      click_button 'Create my account'
      expect(page).to have_content('Welcome to the Sample App!')
    end

    scenario "should fail Email" do
      click_button 'Create my account'
      expect(page).to have_content('Email can\'t be blank')
    end

    scenario "should fail Name" do
      visit new_user_path
      within('form') do
        fill_in 'Email',with: 'lvn1782003@gmail.com'
        fill_in 'Password', with: '132'
        fill_in 'Confirmation', with: '132'
      end
      click_button 'Create my account'
      expect(page).to have_content('Name can\'t be blank')
    end

    scenario "should fail Password" do
      visit new_user_path
      within('form') do
        fill_in 'Name', with: 'Jone'
        fill_in 'Email',with: 'lvn1782003@gmail.com'
        fill_in 'Confirmation', with: '132'
      end
      click_button 'Create my account'
      expect(page).to have_content('Password can\'t be blank')
    end

    scenario "should fail Password confirmation" do
      visit new_user_path
      within('form') do
        fill_in 'Name', with: 'Jone'
        fill_in 'Email',with: 'lvn1782003@gmail.com'
        fill_in 'Password', with: '132'
      end
      click_button 'Create my account'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end
  end
end
