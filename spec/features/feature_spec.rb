feature "navigating" do

  before(:each) do
    Link.create(title: "Example Page", url: "http://example.com", tags: [Tag.create(tag: "example_tag")])
    Link.create(title: "Bubble website", url: "www.bubbles.com", tags: [Tag.create(tag: "bubbles")])
    Link.create(title: "More bubbles", url: "www.mo_betta_bubbles.com", tags: [Tag.create(tag: "bubbles")])
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

  context "tag filtering" do
    scenario "filters links by tag" do
      visit '/tags/bubbles'
      expect(page).not_to have_content("http://example.com")
      expect(page).to have_content("www.bubbles.com")
      expect(page).to have_content("www.mo_betta_bubbles.com")
    end

    scenario "remove filters" do
      visit '/tags/bubbles'
      click_button('Remove Filters')
      expect(page).to have_content("http://example.com")
      expect(page).to have_content("www.bubbles.com")
      expect(page).to have_content("www.mo_betta_bubbles.com")
    end
  end
end
