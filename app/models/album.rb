class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks

  # Paperclip
  has_attached_file :cover,
                    :styles => { :thumb=> "100x100#",
                                 :medium => "400x400#" }

  attr_accessible :title, :cover
end
