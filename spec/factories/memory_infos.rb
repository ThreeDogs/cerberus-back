# == Schema Information
#
# Table name: memory_infos
#
#  id                :integer          not null, primary key
#  mem_total         :integer
#  dalvik_heap_alloc :integer
#  native_heap_size  :integer
#  dalvik_heap_size  :integer
#  native_heap_alloc :integer
#  mem_alloc         :integer
#  client_timestamp  :integer
#  detail_report_id  :integer
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :memory_info do
    mem_total 1
    dalvik_heap_alloc 1
    native_heap_size 1
    dalvik_heap_size 1
    native_heap_alloc "MyString"
    mem_alloc 1
    detail_report nil
  end
end
