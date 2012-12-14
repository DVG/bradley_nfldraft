# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "Franklin McTesterson"
    position "QB"
  end
  factory :undrafted_player do
    name "Bob Dole"
    position "C"
    team nil
  end
  factory :drafted_player do
    name "Barack Obama"
    position "CB"
    team
  end
end
