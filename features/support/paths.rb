module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    user = User.find_by_login('quentin')
    artist = Artist.find_by_name('madonna')

    case page_name

    when /the home\s?page/
      '/'
    when /the new track page for madonna Like a Virgin/
      new_user_artist_album_track_path(user, artist, Album.find_by_title('Like a Virgin'))

    when /the new album page for madonna/
      new_user_artist_album_path(user, artist)

    when /my new artist page/
      new_user_artist_path(user)

    when /the new user page/
      new_user_path

    when /the login page/
      login_path


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
