feature "User entry" do
  scenario "enters email and password" do
    sign_up
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, bernard@malhame.com")
    expect(User.first.email).to eq("bernard@malhame.com")
  end

  scenario "fails confirmation when passwords don't match" do
    expect{sign_up(password_confirmation: "not_matching_password")}.not_to change(User, :count)
    expect(current_path).to eq('/')
    expect(page).to have_content("Password and confirmation password do not match")
  end

  scenario "requires email address to be filled in for sign up" do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario "requires email address to be valid format (realemail@address.com)" do
    expect{sign_up(email: "someone@somewhere")}.not_to change(User, :count)
  end
end
