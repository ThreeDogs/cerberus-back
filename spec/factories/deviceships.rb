# == Schema Information
#
# Table name: deviceships
#
#  id              :integer          not null, primary key
#  total_report_id :integer
#  device_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deviceship do
    total_report nil
    device nil
  end
end
