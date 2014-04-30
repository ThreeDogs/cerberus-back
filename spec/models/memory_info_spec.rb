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

require 'spec_helper'

describe MemoryInfo do
end
