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

require 'spec_helper'

describe Report do
  pending "add some examples to (or delete) #{__FILE__}"
end
