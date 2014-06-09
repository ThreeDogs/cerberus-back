# == Schema Information
#
# Table name: battery_infos
#
#  id               :integer          not null, primary key
#  wifi             :integer
#  threeg           :integer
#  lcd              :integer
#  gps              :integer
#  sound            :integer
#  cpu              :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :battery_info do
    wifi 1
    threeg 1
    lcd 1
    gps 1
    sound 1
    cpu 1
    client_timestamp 1
  end
end
