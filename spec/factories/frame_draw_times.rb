# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :frame_draw_time do
    type ""
    load_start_timestamp 1
    load_finish_timestamp 1
    view_id "MyString"
    detail_report nil
  end
end
