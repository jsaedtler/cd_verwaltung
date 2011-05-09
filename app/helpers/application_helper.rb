module ApplicationHelper
  def breadcrumbs(user,object)
    if false && object.nil?
      "#{link_to(user.login,users_path(user))} - #{link_to('Artists', user_artists_path(user))} - #{link_to(object.artist.name, user_artist_albums_path(user,object.artist))} - #{object.title}"
    end

    links = case object
            when Artist: "#{link_to(user.login,users_path)} - #{link_to('Artists', user_artists_path(user))} - #{object.name}"
            when Album:  "#{link_to(user.login,users_path)} - #{link_to('Artists', user_artists_path(user))} - #{link_to(object.artist.name, user_artist_albums_path(user,object.artist))} - #{object.title}"
            when nil:    "#{link_to(user.login,users_path)}"

            else
              "start"
            end
    "You are here: #{links}".html_safe
  end
end
