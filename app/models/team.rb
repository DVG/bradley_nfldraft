class Team < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :players
  has_many :orders
  
  def acquire(player)
    players << player
  end
end
