require 'rails_helper'

feature 'Sign In and Sign Out' do

  context 'No user signed in' do

    scenario "Can see 'Sign up' and 'Sign in' links" do
      visit '/'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Sign in'
    end

    scenario "Should not see 'Sign out' link" do
      visit '/'
      expect(page).not_to have_content 'Sign out'
    end

    scenario "Should not be able to add a post to Instagram" do
      visit '/'
      expect(page).not_to have_content 'Add a post'
      expect(page).to have_content 'Sign up'
    end

    scenario "Should be prompted to sign in" do
      visit '/'
      expect(page).to have_content "Please Sign up or Sign in"
    end
  end

  context 'Currently has a signed in user' do

    scenario "Can see 'Sign out' link" do
      sign_up
      expect(page).to have_content 'Sign out'
    end

    scenario "Should not see 'Sign up' or 'Sign in' links" do
      sign_up
      expect(page).not_to have_content 'Sign up'
      expect(page).not_to have_content 'Sign in'
    end

    scenario "Should be told who is currently signed in" do
      sign_up
      expect(page).to have_content "You are currently signed in as jonny@mail.com"
    end
  end
end
