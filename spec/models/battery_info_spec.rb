# == Schema Information
#
# Table name: battery_infos
#
#  id               :integer          not null, primary key
#  wifi             :integer
#  threeg           :integer
#  lcd              :integer
#  gps              :integer
#  sound            :integer
#  cpu              :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe BatteryInfo do
  pending "add some examples to (or delete) #{__FILE__}"
end
