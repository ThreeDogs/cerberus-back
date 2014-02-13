# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
	belongs_to :user
	has_many :reports

	validates :name, presence: true
  validates :user_id, presence: true
end
