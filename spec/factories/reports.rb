# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  package_name  :string(255)
#  icon          :string(255)
#  app_version   :string(255)
#  os_version    :string(255)
#  device_name   :string(255)
#  country       :string(255)
#  time_for_test :decimal(, )
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    package_name "com.android.sample"
    icon "/public/rails.png"
    app_version "1.0"
    os_version "4.1"
    device_name "SHEV-640"
    country "KR"
    time_for_test "109.99"
    project_id 1
  end

  factory :init_report, parent: :report do
    package_name "com.android.sample"
    icon "/public/rails.png"
    app_version "1.0"
    os_version "4.1"
    device_name "SHEV-640"
    country "KR"
    time_for_test ""
    project_id 1
  end

  factory :invalid_report, parent: :report do
  	project_id nil
  end
end
