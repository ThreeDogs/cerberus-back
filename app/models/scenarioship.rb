# == Schema Information
#
# Table name: scenarioships
#
#  id               :integer          not null, primary key
#  total_report_id  :integer
#  test_scenario_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Scenarioship < ActiveRecord::Base
  belongs_to :total_report
  belongs_to :test_scenario
end
