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
  
  def self.undrafted_by_position
    self.order('position ASC, name ASC').undrafted_players.group_by(&:position)
  end
  
  
  # Returns last 3 drafted players
  def self.latest_picks
    ownerships = Ownership.all
    order('created_at DESC').where('id in (?)', ownerships.map(&:player_id)).limit(3)
  end
end
