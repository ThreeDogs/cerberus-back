# == Schema Information
#
# Table name: codeships
#
#  id              :integer          not null, primary key
#  test_code_id    :integer
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Codeship < ActiveRecord::Base
  belongs_to :test_code
  belongs_to :total_report
end
