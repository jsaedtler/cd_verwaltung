class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :comments, :order => 'comments.created_at desc'
  has_one :user, :through => :artist

  # Paperclip
  has_attached_file :cover,
                    :styles => { :thumb=> "100x100#",
                                 :medium => "400x400#" }

  attr_accessible :title, :cover
  validates_length_of :title, :minimum => 1


  def self.search(query)
    Album.find(:all,
          :include => :artist,
          :conditions => [
                 "albums.title like :query or artists.name like :query",
                 {:query => "%#{query}%"}])    
  end
  
end
