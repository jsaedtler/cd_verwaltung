class Track < ActiveRecord::Base
  belongs_to :album

  attr_accessible :title, :duration
end
