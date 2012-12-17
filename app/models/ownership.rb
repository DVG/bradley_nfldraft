class Ownership < ActiveRecord::Base
  attr_accessible :player, :team
  
  validates_presence_of :player
  validates_presence_of :team
  
  belongs_to :player
  belongs_to :team
end
