# == Schema Information
#
# Table name: network_infos
#
#  id               :integer          not null, primary key
#  response_size    :integer
#  request_size     :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe NetworkInfo do
  pending "add some examples to (or delete) #{__FILE__}"
end
