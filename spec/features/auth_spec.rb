require 'spec_helper'

feature "the signup process" do
  before(:each) { visit new_user_url}
  it "has a new user page" do
    expect(page).to have_content "New user"
  end

  it "has a username field" do
    expect(page).to have_content "Username"
  end

  it "has a username and password field" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  feature "signing up a user" do
    before (:each) do
      visit new_user_url
      fill_in 'Username', :with   => "the_user64"
      fill_in 'Password', :with   => "cupcakes"
      click_on "Create User"
    end

    it "redirects to the goals page after signup" do
      expect(page).to have_content "the_user64"
      expect(page).to have_content "Goals"
    end

    feature "logging in a user" do
      before (:each) do
        visit new_session_url
        fill_in 'Username', :with => "the_user64"
        fill_in 'Password', :with => "cupcakes"
        click_button "Sign In"
      end

      it "redirects to the home page after log in" do
        expect(page).to have_content "the_user64"
        expect(page).to have_content "Goals"
      end
    end

    feature "logging out a user" do
      before (:each) do
        click_button "Log Out"
      end
      it "redirects to the sign in page" do
        expect(page).to have_content "Sign In"
      end
      it "no longer displays username" do
        expect(page).to_not have_content "the_user64"
      end
    end
  end
end






