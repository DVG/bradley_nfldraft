class Player < ActiveRecord::Base
  validates_presence_of :name, :position
  attr_accessible :name, :position
  
  has_one :ownership
  has_one :team, :through => :ownership
  
  def draftable?
    self.team ? false : true
  end
  
  def self.undrafted_players
    where('id not in (?)', Ownership.all.map(&:player_id))
  end
end
