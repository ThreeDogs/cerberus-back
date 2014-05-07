# == Schema Information
#
# Table name: deviceships
#
#  id              :integer          not null, primary key
#  total_report_id :integer
#  device_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Deviceship < ActiveRecord::Base
  belongs_to :total_report
  belongs_to :device
end
