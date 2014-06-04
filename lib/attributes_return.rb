module AttributesReturn
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

	def status_rate
		attributes_return_rate("status")
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