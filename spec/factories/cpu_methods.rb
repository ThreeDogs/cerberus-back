# == Schema Information
#
# Table name: cpu_methods
#
#  id               :integer          not null, primary key
#  tree_key         :integer
#  parent_key       :integer
#  class_name       :string(255)
#  method_name      :string(255)
#  start_timestamp  :integer
#  end_timestamp    :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

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
