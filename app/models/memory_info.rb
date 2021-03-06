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

class MemoryInfo < ActiveRecord::Base
	default_scope { order('client_timestamp DESC') } 
  belongs_to :detail_report
end
