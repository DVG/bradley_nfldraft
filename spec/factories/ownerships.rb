# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ownership do
    player
    team
    order
  end
end
