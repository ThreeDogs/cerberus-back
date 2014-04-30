# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
#  test_datetime    :string(255)
#  status           :integer
#  running_time     :float
#  device_key       :string(255)
#  test_scenario_id :integer
#  total_report_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :detail_report do
    app_version "MyString"
    test_datetime "MyString"
    status 1
    running_time 1
    test_scenario nil
    device_id 1
    total_report nil
  end
end
