# == Schema Information
#
# Table name: crashes
#
#  id               :integer          not null, primary key
#  error_name       :string(255)
#  description      :text
#  total_reports_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Crash < ActiveRecord::Base
	belongs_to :total_report
	has_many :detail_reports
end
