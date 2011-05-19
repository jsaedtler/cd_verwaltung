Given /^the following albums:$/ do |albums|
  user = User.find_by_login('quentin')
  albums.hashes.each do |hash|
    user = User.find_by_login(hash.delete('user'))
    artist = Artist.find_or_create_by_name_and_user_id(hash.delete("artist"), user.id)
    artist.albums.create!(hash)
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) album$/ do |pos|
  visit albums_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following albums:$/ do |expected_albums_table|
  expected_albums_table.diff!(tableish('table tr', 'td,th'))
end

Then /^I should see the image "([^"]*)"$/ do |image|
  page.all(:xpath,"//img[@alt='#{image}']").should_not be_empty
end
