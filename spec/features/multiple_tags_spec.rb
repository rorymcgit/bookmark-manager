feature "Adding multiple tags" do
  scenario "can add 2 tags to new link" do
    visit '/links/new'
    fill_in :url, with: "www.makersacademy.com"
    fill_in :name, with: "Makers Academy"
    fill_in :tag, with: "education ruby"
    click_button("Save Bookmark")
    link = Link.first
    expect(link.tags.map(&:tag)).to include("education", "ruby")
  end
end
