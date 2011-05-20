class Track < ActiveRecord::Base
  belongs_to :album

  attr_accessible :title, :duration

  def self.search(query)
    find(:all,
         :include => {:album => :artist},
         :conditions => [
           "tracks.title like :query or artists.name like :query",
           {:query => "%#{query}%"}])
  end
  
end
