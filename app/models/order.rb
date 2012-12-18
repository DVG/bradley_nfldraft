class Order < ActiveRecord::Base
  attr_accessible :pick, :round, :team_id
  belongs_to :team
  
  default_scope order('round ASC, pick ASC')
  
  def self.next
    where(:consumed => false).first
  end
  
  def self.next?
    if self.next == nil #if next returns nil there aren't anymore orders
      return false
    else
      return true
    end
  end
end
