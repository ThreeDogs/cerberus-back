# == Schema Information
#
# Table name: frame_draw_times
#
#  id                    :integer          not null, primary key
#  type                  :string(255)
#  load_start_timestamp  :integer
#  load_finish_timestamp :integer
#  view_id               :string(255)
#  detail_report_id      :integer
#  created_at            :datetime
#  updated_at            :datetime
#

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
