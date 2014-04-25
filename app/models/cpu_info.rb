# == Schema Information
#
# Table name: cpu_infos
#
#  id               :integer          not null, primary key
#  usage            :integer
#  client_timestamp :string(255)
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class CpuInfo < ActiveRecord::Base
  belongs_to :detail_report
end
