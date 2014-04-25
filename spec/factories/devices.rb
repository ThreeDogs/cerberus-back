# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  brand           :string(255)
#  cpu             :string(255)
#  model           :string(255)
#  os_version      :string(255)
#  country         :string(255)
#  device_key      :string(255)
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    brand "MyString"
    cpu_info "MyString"
    model "MyString"
    os_version "MyString"
    country "MyString"
    device_key "MyString"
    total_report nil
  end
end
