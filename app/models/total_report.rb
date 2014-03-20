# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  apk           :string(255)
#  test_datetime :string(255)
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class TotalReport < ActiveRecord::Base
  belongs_to :project
  has_many :detail_reports

  validates :apk, presence: true
  # validates :test_datetime, presence: true
end
