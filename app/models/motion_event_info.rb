# == Schema Information
#
# Table name: motion_event_infos
#
#  id               :integer          not null, primary key
#  activity_class   :string(255)
#  param            :string(255)
#  view             :string(255)
#  action_type      :string(255)
#  sleep            :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class MotionEventInfo < ActiveRecord::Base
  belongs_to :detail_report
  has_one :screen, foreign_key: 'client_timestamp', primary_key: 'client_timestamp'

  def src
   	# screen.image.url if screen
   	screen.image if screen
  end 
end
