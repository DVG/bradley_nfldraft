class Player < ActiveRecord::Base
  validates_presence_of :name, :position
  attr_accessible :name, :position
  
  has_one :ownership
  has_one :team, :through => :ownership
  
  def draftable?
    self.team ? false : true
  end
  
  def self.undrafted_players
    ownerships = Ownership.all
    if ownerships.length == 0
      all
    else
      where('id not in (?)', ownerships.map(&:player_id))
    end
  end
end
