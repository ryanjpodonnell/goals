require 'spec_helper'

feature "Comments on goals" do
  before(:each) do
    sign_up("hello_world")
    create_public_goal
      visit(goal_url(Goal.first))
  end

  it "should be made from the show page" do
    expect(page).to have_content("Add Comment")
  end

  before(:each) do
    fill_in 'Body', :with => "You will never lose weight, ya ding dong!"
    click_on "Add Comment"
  end

  it "should post to a goals show page" do
    expect(page).to have_content "dong"
  end

  it "should redirect to the goals show page" do
    expect(page).to have_content "New Goal"
  end
end

feature "Comments on users" do
  before(:each) do
    sign_up("hello_world")
    click_button("Log Out")
    sign_up("goodbye_cruel_world")
    visit(user_url(User.find_by_username("hello_world")))
  end
  it "should be made from the users show page" do
    expect(page).to have_content "Add Comment"
  end

  before(:each) do
    fill_in "Body", :with => "You are a fatty, fatty, boobalattie"
    click_on "Add Comment"
  end

  it "should post to a users show page" do
    expect(page).to have_content "boobalattie"
  end

  it "should redirect to the users show page" do
    expect(page).to have_content "hello_world"
  end
end