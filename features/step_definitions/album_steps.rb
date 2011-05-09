Given /^the following albums:$/ do |albums|
  user = User.find_by_login('quentin')
  artist = user.artists.find_by_name('madonna')
  albums.hashes.each do |hash|
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
