require 'spec_helper'

feature 'Authentications', :type => :feature do

  context 'Login process' do
    background do
      @user = FactoryGirl.create(:user)
    end

    scenario 'Signing in with correct credentials' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => @user.password
      end

      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'Signing in with incorrect credentials' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => 'wrong password'
      end

      click_button 'Sign in'
      expect(page).to have_content 'Invalid email or password.'
    end
  end


  context 'Registration process' do
    background do
      @user = FactoryGirl.build(:user)
    end

    scenario 'Signing up with required attributes' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => @user.password
        fill_in 'Password confirmation', :with => @user.password
      end

      click_button 'Sign up'
      expect(page).to have_content 'signed up successfully.'
    end

    scenario 'Signing up without filling all required attributes' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'Email', :with => @user.email
      end

      click_button 'Sign up'
      expect(page).to have_content 'prohibited this user from being saved'
    end
  end
end
