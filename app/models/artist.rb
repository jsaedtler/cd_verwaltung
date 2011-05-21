class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :albums

  validates_presence_of :name

  attr_accessible :name
end
