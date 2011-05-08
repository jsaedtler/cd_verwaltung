class Comment < ActiveRecord::Base
  belongs_to :album

  attr_accessible :content

end
