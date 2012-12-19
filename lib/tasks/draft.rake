require 'csv'
require 'rubygems'
require 'capybara'
require 'capybara/dsl'

include Capybara::DSL

Capybara.run_server = true
Capybara.current_driver = :selenium
Capybara.app_host = 'localhost:3000'

Data_Directory = "#{Rails.root}/lib/data/"

namespace :draft do
  task :seed => [:environment]  do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["draft:seed_teams"].execute
    Rake::Task["draft:seed_orders"].execute
    Rake::Task["draft:seed_players"].execute
  end
  
  desc "Seeding Teams"
  task :seed_teams => [:environment] do
    CSV.foreach("#{Data_Directory}teams.csv", headers: true) do |row|
      t = Team.new(name: row["Team Name"].strip, division: row["Division"].strip)
      t.save!
    end
  end
  
  desc "Seeding Order"
  task :seed_orders => [:environment] do
    CSV.foreach("#{Data_Directory}order.csv", headers: true) do |row|
      name = row["Team Name"].strip
      #handle NY => New York conversion
      if name.match /(NY)/
        name.gsub!(/(NY)/, "New York")
      end
      team = Team.find_by_name(name)
      o = Order.new(round: row["Round"].strip, pick: row["Pick"].strip, team_id: team.id)
      o.save!
    end
  end
  
  desc "Seeding Players"
  task :seed_players => [:environment] do
    CSV.foreach("#{Data_Directory}players.csv", headers: true) do |row|
      p = Player.new(name: row["Player Name"].strip, position: row["Position"].strip)
      p.save!
    end
  end
  
  desc "Runs a Simulation of a complete draft"
  task :simulate_draft => [:environment] do
    visit '/'
    click_link 'Draft'
    while Order.next? do
      click_button 'Confirm Draft Selection'
    end
    click_link 'Results By Round'
    sleep 5
  end
end