module ApplicationHelper
  def breadcrumbs(object)
    return "" if object.nil?
    links = case object
            when Artist: "#{link_to('Artists', artists_path)} - #{object.name}"
            when Album:  "#{link_to('Artists', artists_path)} - #{link_to(object.artist.name, artist_albums_path(object.artist))} - #{object.title}"
            else
              "start"
            end
    "You are here: #{links}".html_safe
  end
end
