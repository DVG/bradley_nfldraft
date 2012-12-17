# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "Franklin McTesterson"
    position "QB"
  end
  factory :undrafted_player, class: Player do
    name "Bob Dole"
    position "C"
    ownership nil
  end
  factory :drafted_player, class: Player do
    name "Barack Obama"
    position "CB"
    ownership
  end
end
