feature "creating links" do
  scenario "saves user input (to link database) and shows it on links page" do
    enter_link_and_url
    click_button("Save Bookmark")
    expect(current_path).to eq '/links'
    expect(page).to have_content("#{@link_url}")
    expect(page).to have_content("#{@link_name}")
  end

  scenario "adds tag along with new link url/title" do
    enter_link_and_url
    link_tag = "random"
    fill_in :tag, with: link_tag
    click_button("Save Bookmark")
    expect(page).to have_content("#{link_tag}")
  end
end
