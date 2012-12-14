class Player < ActiveRecord::Base
  validates_presence_of :name, :position
  attr_accessible :name, :position
  belongs_to :team
  
  def draftable?
    self.team_id ? false : true
  end
end
