class Order < ActiveRecord::Base
  attr_accessible :pick, :round, :team_id
  belongs_to :team
end
