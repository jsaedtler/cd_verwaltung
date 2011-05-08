class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :comments, :order => 'comments.created_at desc'

  # Paperclip
  has_attached_file :cover,
                    :styles => { :thumb=> "100x100#",
                                 :medium => "400x400#" }

  attr_accessible :title, :cover

  validates_length_of :title, :minimum => 1
end
