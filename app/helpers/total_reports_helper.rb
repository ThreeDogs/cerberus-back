module TotalReportsHelper
	def get_device_list(test_bed_url = "http://172.16.101.207:9001")
    uri = URI("#{test_bed_url}/getDeviceInfo")
    res = Net::HTTP.get(uri)
    # puts res
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    res
  end
end
