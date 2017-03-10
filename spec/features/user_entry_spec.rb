feature "User entry" do
  scenario "enters email and password" do
    sign_up
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, bernard@malhame.com")
    expect(User.first.email).to eq("bernard@malhame.com")
  end

  scenario "fails confirmation when passwords don't match" do
    expect{sign_up(password_confirmation: "not_matching_password")}.not_to change(User, :count)
  end
end
