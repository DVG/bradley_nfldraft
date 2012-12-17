# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "Franklin McTesterson"
    position "QB"
    team nil
  end
  factory :undrafted_player, class: Player do
    name "Bob Dole"
    position "FB"
    team nil
  end
  factory :drafted_player, class: Player do
    name "Barack Obama"
    position "CB"
    team
  end
end
