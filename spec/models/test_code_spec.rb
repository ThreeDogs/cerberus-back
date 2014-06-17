# == Schema Information
#
# Table name: test_codes
#
#  id                :integer          not null, primary key
#  import_code_java  :string(255)
#  import_code_class :string(255)
#  project_id        :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe TestCode do
  pending "add some examples to (or delete) #{__FILE__}"
end
