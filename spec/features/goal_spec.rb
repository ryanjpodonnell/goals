require 'spec_helper'

feature "The Goals Creation" do
  before(:each) do
    sign_up("hello_world")
    visit new_goal_url
  end
  it "should have New Goal content" do
    expect(page).to have_content "New Goal"
  end
  it "should have a title" do
    expect(page).to have_content "Title"
  end
  it "should have a description" do
    expect(page).to have_content "Description"
  end
  it "should be able to be set to private" do
    expect(page).to have_content "Private?"
  end
end

feature "The Goal Index Page" do
  before(:each) do
    sign_up("hello_world")
  end

  it "should have a create new goal" do
    expect(page).to have_content "Create New Goal"
  end

  it "should redirect you to a new goal page upon click" do
    click_link("Create New Goal")
    expect(page).to have_content("New Goal")
  end

  it "should have a logout button" do
    expect(page).to have_button("Log Out")
  end
end

feature "Edit Goals" do
  before(:each) do
    sign_up("hello_world")
    create_public_goal
  end
  it "should take you to the edit goal page" do
    click_on "Edit Goal"
    expect(page).to have_content("Edit")
  end
end