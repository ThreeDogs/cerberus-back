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

require 'spec_helper'

describe MotionEventInfo do
end
