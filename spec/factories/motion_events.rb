# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :motion_event do
    seq_id 1
    time_stamp "2014-02-20 16:33:41"
    sleep 1
    activity_class "MyString"
    action_type "MyString"
    param "MyString"
    view "MyString"
    report_id 1
  end
end
