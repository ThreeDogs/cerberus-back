# == Schema Information
#
# Table name: cpu_infos
#
#  id              :integer          not null, primary key
#  cpu_usage       :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cpu_info do
    cpu_usage 1
    motion_event_id 1
    report_id 1
  end
end
