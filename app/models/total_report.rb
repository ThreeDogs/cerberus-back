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

class TotalReport < ActiveRecord::Base
	default_scope { order('created_at DESC') } 
	scope :complete_total_reports, -> {where(status: true)}

  belongs_to :apk
  belongs_to :project
  has_many :detail_reports

  # validates :test_datetime, presence: true
  def apk_name
  	apk.apk_name
  end

  def test_date
  	created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  def number_of_scenarios
    112
  end

  def number_of_devices
    10
  end
end
