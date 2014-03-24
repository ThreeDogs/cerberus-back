# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class TotalReport < ActiveRecord::Base
	default_scope { order('created_at DESC') } 

  belongs_to :apk
  belongs_to :project
  has_many :detail_reports

  # validates :test_datetime, presence: true
end
