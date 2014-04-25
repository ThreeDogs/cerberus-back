# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  brand           :string(255)
#  cpu             :string(255)
#  model           :string(255)
#  os_version      :string(255)
#  country         :string(255)
#  device_key      :string(255)
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Device do
end
