feature App do

  before do
    Link.create(title: "Example Page", url: "http://example.com")
  end

  scenario "expect homepage to return 200" do
    visit '/'
    click_button('View bookmarks')
    expect(current_path).to eq('/links')
  end

  scenario "logging into links page gives list of bookmarks" do
    visit '/links'
    expect(page).to have_content("Example Page")
    expect(page).to have_content("http://example.com")
  end

  scenario "go to create new bookmark page from links" do
    visit '/links'
    click_button("Create New Bookmark")
    expect(current_path).to eq('/links/new')
  end
end
