class Team < ActiveRecord::Base
  attr_accessible :name, :division
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :ownerships
  has_many :players, :through => :ownerships
  has_many :orders
  
  def acquire(player)
    players << player
  end
end
