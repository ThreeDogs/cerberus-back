# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cpu_method do
    tree_key 1
    parent_key 1
    class_name "MyString"
    method_name "MyString"
    start_timestamp 1
    end_timestamp 1
    detail_report nil
  end
end
