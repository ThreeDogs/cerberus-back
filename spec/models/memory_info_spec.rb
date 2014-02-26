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

require 'spec_helper'

describe MemoryInfo do
  pending "add some examples to (or delete) #{__FILE__}"
end
