# == Schema Information
#
# Table name: memory_infos
#
#  id              :integer          not null, primary key
#  dalvik_size     :integer
#  dalvik_alloc    :integer
#  native_size     :integer
#  native_alloc    :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :memory_info do
    dalvik_size 1
    dalvik_alloc 1
    native_size 1
    native_alloc 1
    motion_event_id 1
    report_id 1
  end
end
