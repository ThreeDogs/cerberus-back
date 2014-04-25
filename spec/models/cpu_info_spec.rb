# == Schema Information
#
# Table name: cpu_infos
#
#  id               :integer          not null, primary key
#  usage            :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe CpuInfo do
  pending "add some examples to (or delete) #{__FILE__}"
end
