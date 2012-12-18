# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    round 1
    pick 1
    team
    factory :consumed_order do
      consumed true
    end
  end
end
