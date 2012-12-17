# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "team #{n}"
  end
  factory :team do
    name
  end
end
