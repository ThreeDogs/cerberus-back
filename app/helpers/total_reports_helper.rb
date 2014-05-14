module TotalReportsHelper
	def get_device_list(test_bed_url = TEST_BED_URL)
    uri = URI("#{test_bed_url}/DeviceInfo")
    res = Net::HTTP.get(uri)
    # puts res
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    res
  end
end
