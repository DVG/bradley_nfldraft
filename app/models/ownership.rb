class Ownership < ActiveRecord::Base
  attr_accessible :player_id, :team_id
  
  validates_presence_of :player
  validates_presence_of :team
  
  belongs_to :player
  belongs_to :team
  belongs_to :order
  
  delegate :round, :to => :order
  
  def drafted_in(order)
    self.order = order
    self.save
  end
  
  def self.results_by_round
    includes(:order).group_by(&:round)
  end
end
