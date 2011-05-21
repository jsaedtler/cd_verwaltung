class Comment < ActiveRecord::Base
  belongs_to :album
  belongs_to :user

  attr_accessible :content

  validates_presence_of :content
end
