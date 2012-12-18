# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Steelers", "Bengals", "Browns"].each do |name|
  Team.find_or_create_by_name name
end

(1..3).each do |num|
  o = Order.new
  o.round = rand(2)+1
  o.pick = num
  o.team = Team.find(num)
  o.save
end

["Bob", "Barry", "Fred"].each do |name|
  p = Player.new
  p.name = name
  p.position = "QB"
  p.save
end