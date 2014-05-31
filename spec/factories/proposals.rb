# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposal do
    name "MyString"
    description "MyString"
    user nil
  end
end
