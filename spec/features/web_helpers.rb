def enter_link_and_url
  visit '/links/new'
  @link_url  = "www.newlink.com"
  @link_name = "New link"
  fill_in :url, with: @link_url
  fill_in :name, with: @link_name
end


def sign_up(email: "bernard@malhame.com",
            password: "great_password",
            password_confirmation: "great_password")
  visit '/'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button("Sign Up")
end
