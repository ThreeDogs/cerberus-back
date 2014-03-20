# == Schema Information
#
# Table name: test_scenarios
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :string(255)
#  rank            :integer
#  project_id      :integer
#  scenarioship_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class TestScenario < ActiveRecord::Base
  belongs_to :project

  has_many :motion_events
  has_many :detail_reports

  validates :name, presence: true
  validates :description, presence: true
  # validates :rank, presence: true
end
