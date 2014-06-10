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

require 'spec_helper'

describe FrameDrawTime do
  pending "add some examples to (or delete) #{__FILE__}"
end
