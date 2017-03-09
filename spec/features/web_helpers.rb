def enter_link_and_url
  visit '/links/new'
  @link_url  = "www.newlink.com"
  @link_name = "New link"
  fill_in :url, with: @link_url
  fill_in :name, with: @link_name
end
