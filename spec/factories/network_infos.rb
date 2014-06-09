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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network_info do
    response_size 1
    request_size 1
    client_timestamp 1
  end
end
