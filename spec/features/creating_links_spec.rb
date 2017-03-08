feature App do
  scenario "saves user input to link database" do
    visit '/links/new'
    link_url  = "www.newlink.com"
    link_name = "New link"
    fill_in :url, with: link_url
    fill_in :name, with: link_name
    click_button("Save")
    expect(page).to have_content("#{link_url}")
    expect(page).to have_content("#{link_name}")
  end
end
