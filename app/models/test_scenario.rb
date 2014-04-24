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
  before_validation :name_generate
	default_scope {order('created_at DESC')}
  belongs_to :project

  has_many :motion_events
  has_many :detail_reports

  validates :name, presence: true
  # validates :description, presence: true
  # validates :rank, presence: true

  # rank 0,1,2,3 A,B,C,D

  def get_rank
  	if rank==0
  		"A"
  	elsif rank==1
  		"B"
  	elsif rank==2
  		"C"
  	elsif rank==3
  		"D"
  	end
  end

  def recent_test_date
  	# implement
  	"14.MAR.03 3:00pm"
  end

  private 

  def name_generate
    self.name = "TestScenario #{DateTime.now.to_s}"
  end
end
