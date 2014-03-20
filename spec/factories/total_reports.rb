# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  apk           :string(255)
#  test_datetime :string(255)
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :total_report do
    apk "MyString"
    test_datetime "MyString"
    project nil
    deviceship_id 1
  end
end
