require 'rails_helper'

feature "angular test" do

  let(:email)    { "greg@iinet.net.au" }
  let(:password) { "secret123" }

  before do
    User.create!(email: email,
                 password: password,
                 password_confirmation: password)
  end

  # tests will go here...



  # setup from before...

  scenario "Our Angular Test App is Working" do
    visit "/angular_test"

    # Log In
    fill_in      "Email",    with: "greg@iinet.net.au"
    fill_in      "Password", with: "secret123"
    click_button "Log in"

    # Check that we go to the right page
    expect(page).to have_content("Name")

    # Test the page
    fill_in "name", with: "Greg"
    within "header h1" do
      expect(page).to have_content("Hello, Greg")
    end
  end
 
end
