feature App do

  Link.create(title: "Example Page", url: "http://example.com")

  scenario "expect homepage to return 200" do
    visit '/'
    expect(page.status_code).to eq(200)
  end


  scenario "logging into links page gives list of bookmarks" do
    visit '/links'
    expect(page).to have_content("Example Page")
    expect(page).to have_content("http://example.com")
  end
end
