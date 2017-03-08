feature App do

  Link.create(title: "Example Page", url: "http://example.com")

  scenario "logging into links page gives list of bookmarks" do
    visit '/links'
    expect(page).to have_content("http://example.com")
  end
end
