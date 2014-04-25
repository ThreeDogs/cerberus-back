# == Schema Information
#
# Table name: motion_event_infos
#
#  id               :integer          not null, primary key
#  activity_class   :string(255)
#  param            :string(255)
#  view             :string(255)
#  action_type      :string(255)
#  sleep            :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :motion_event_info do
    activity_class "MyString"
    param "MyString"
    view "MyString"
    action_type "MyString"
    sleep 1
    detail_report nil
  end
end
