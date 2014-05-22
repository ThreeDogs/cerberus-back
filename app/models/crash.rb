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
	include AttributesReturn
	belongs_to :total_report
	has_many :detail_reports

	def error_count
		detail_reports.count
	end

	def error_rank
		# implement
		detail_reports.first.rank
	end

	# ex) ?error_ranks[]=A&error_ranks[]=B&error_ranks[]=C&error_ranks[]=D
	# ex)  &os_versions[]
	def self.search(error_ranks=nil, os_versions=nil)
		if error_ranks && os_versions
			select {|c| is_error_ranks?(c.error_rank, error_ranks) && include_os_versions?(c, os_versions)}
		elsif error_ranks
			select {|c| is_error_ranks?(c.error_rank, error_ranks)}
		elsif os_versions
			select {|c| include_os_versions?(c, os_versions)}
		else
			all
		end
	end

	def self.include_os_versions?(crash, os_versions)
		os_versions.each do |os_version|
			return true if crash.os_version_rate.keys.include?(os_version)
		end
		false
	end

	def self.is_error_ranks?(rank, error_ranks)
		error_ranks.length.times do |i|
			return true if rank == error_ranks[i]
		end
		false
	end
end
