class Order < ActiveRecord::Base
  attr_accessible :pick, :round, :team_id
  belongs_to :team
  
  default_scope order('round ASC, pick ASC')
  
  def self.next
    where(:consumed => false).first
  end
end
