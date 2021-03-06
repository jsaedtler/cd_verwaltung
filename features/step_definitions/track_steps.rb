Given /^the following tracks:$/ do |tracks|
  user = User.find_by_login('quentin')
  artist = user.artists.find_by_name('madonna')
  album = artist.albums.find_by_title('Like a Virgin') # default

  tracks.hashes.each do |hash|
    album = Album.find_by_title(hash.delete("album")) if hash["album"]
    album.tracks.create!(hash)
  end

end

When /^I delete the (\d+)(?:st|nd|rd|th) track$/ do |pos|
  visit tracks_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following tracks:$/ do |expected_tracks_table|
  expected_tracks_table.diff!(tableish('table tr', 'td,th'))
end
