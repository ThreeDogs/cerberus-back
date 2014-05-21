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

	def error_count
		detail_reports.count
	end

	def error_rank
		# implement
		detail_reports.first.rank
	end

	def test_rank_rate
		attributes_return_rate("rank")
	end

	def os_version_rate
		attributes_return_rate("os_version")
	end

	def device_rate
		attributes_return_rate("device_name")
	end

	def country_rate
		attributes_return_rate("device_country")
	end

	private

	def attributes_return_rate(attribute)
		detail_report_attributes = detail_reports.collect{|d| d.send(attribute)}
		result = {}
		detail_report_attributes.each do |attribute|
			if result["#{attribute}"]
				result["#{attribute}"] = result["#{attribute}"] + 1
			else
				result["#{attribute}"] = 1
			end
		end
		result		
	end
end
