# == Schema Information
#
# Table name: scenarioships
#
#  id               :integer          not null, primary key
#  total_report_id  :integer
#  test_scenario_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scenarioship do
    total_report nil
    test_scenario nil
  end
end
