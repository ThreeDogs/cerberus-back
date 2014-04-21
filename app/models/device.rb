# == Schema Information
#
# Table name: devices
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  os_version    :string(255)
#  model_name    :string(255)
#  cpu_info      :string(255)
#  deviceship_id :integer
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Device < ActiveRecord::Base
  belongs_to :project
end
