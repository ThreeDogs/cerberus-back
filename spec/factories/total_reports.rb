# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :total_report do
  	status false
    apk_id 1
    test_datetime "2013/03/03 3:00pm"
    project_id 1
    deviceship_id 1
  end

  factory :total_report_true, parent: :total_report do
  	status true
    apk_id 1
    test_datetime "2013/03/03 3:00pm"
    project_id 1
    deviceship_id 1
  end
end
