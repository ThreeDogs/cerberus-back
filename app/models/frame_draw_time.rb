# == Schema Information
#
# Table name: frame_draw_times
#
#  id                    :integer          not null, primary key
#  type                  :string(255)
#  load_start_timestamp  :integer
#  load_finish_timestamp :integer
#  view_id               :string(255)
#  detail_report_id      :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class FrameDrawTime < ActiveRecord::Base
  belongs_to :detail_report
end
