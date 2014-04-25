# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
#  test_datetime    :string(255)
#  status           :integer
#  running_time     :integer
#  device_key       :string(255)
#  test_scenario_id :integer
#  total_report_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe DetailReport do
  
end
