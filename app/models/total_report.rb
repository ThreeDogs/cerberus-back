# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  app_version   :string(255)
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
require 'net/http'

class TotalReport < ActiveRecord::Base
	default_scope { order('created_at DESC') } 
	scope :complete_total_reports, -> {where(status: true)}

  belongs_to :apk
  belongs_to :project
  has_many :detail_reports

  def start_test
    uri = URI("http://172.16.101.246:9000/apk_info_send?apk_url=testurl&total_report_id=1")
    res = Net::HTTP.get(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end

  # validates :test_datetime, presence: true
  def apk_name
  	apk.apk_name
  end

  def test_date
  	created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  def number_of_scenarios
    # implement
    112
  end

  def number_of_devices
    # implement
    10
  end

  def test_rank_status
    # implement
    {A:[17,7],B:[23,34], C:[10,5], D:[19,2]}
  end
end
