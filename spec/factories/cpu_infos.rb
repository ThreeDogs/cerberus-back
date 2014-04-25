# == Schema Information
#
# Table name: cpu_infos
#
#  id               :integer          not null, primary key
#  usage            :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cpu_info do
    usage 1
    detail_report nil
  end
end
