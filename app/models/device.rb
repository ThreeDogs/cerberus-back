# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  brand           :string(255)
#  cpu             :string(255)
#  model           :string(255)
#  os_version      :string(255)
#  country         :string(255)
#  device_key      :string(255)
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Device < ActiveRecord::Base
	include Rails.application.routes.url_helpers
	belongs_to :project
	belongs_to :total_report
  
  has_many :detail_reports, foreign_key: 'device_key', primary_key: 'device_key'

  def error_reports
    detail_reports.where("status = ?", -1)
  end

  def fail_data
  	results = {}
  	fail_get_ranks.each do |rank|
  		results["#{rank}"] = detail_reports.collect do |detail_report|
  			hash = {}
  			if detail_report.rank == rank && detail_report.status == -1
  				hash["scenario_name"] = detail_report.test_scenario_name
  				hash["error_message"] = detail_report.error_name
  				hash["link"] = total_report_detail_report_path(id, detail_report.id)
  				hash
  			else
  				nil
  			end
  		end.compact
  	end
  	results
  end

  def fail_get_ranks
  	detail_reports.collect{|d| d.rank}.uniq
  end
end
