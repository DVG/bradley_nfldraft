class Team < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  
  has_many :players
  
  def acquire(player)
    players << player
  end
end
