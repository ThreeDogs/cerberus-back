class Codeship < ActiveRecord::Base
  belongs_to :test_code
  belongs_to :total_report
end
