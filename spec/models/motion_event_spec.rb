# == Schema Information
#
# Table name: motion_events
#
#  id             :integer          not null, primary key
#  seq_id         :integer
#  time_stamp     :datetime
#  sleep          :integer
#  activity_class :string(255)
#  action_type    :string(255)
#  param          :string(255)
#  view           :string(255)
#  report_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe MotionEvent do
  pending "add some examples to (or delete) #{__FILE__}"
end
