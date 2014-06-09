# == Schema Information
#
# Table name: test_scenarios
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :string(255)
#  rank            :integer          default(0)
#  project_id      :integer
#  scenarioship_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_scenario do
    name "MyString"
    description "MyString"
    rank 1
    project nil
    scenarioship_id 1
  end
end
