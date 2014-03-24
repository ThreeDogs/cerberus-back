# == Schema Information
#
# Table name: apks
#
#  id         :integer          not null, primary key
#  apk        :string(255)
#  test_apk   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Apk < ActiveRecord::Base
	before_create :make_test_apk_folder
	after_create :generate_test_apk

	belongs_to :project
	has_many :total_reports

	mount_uploader :apk, ApkUploader

	validates :apk, presence: true

	def test_apk_name
		test_apk.split("/").last
	end

	def apk_name(apk_url = apk.to_s)
		apk_url.split("/").last
	end

  private

  def generate_test_apk
  	secret_password = "Zodlxj10"
  	shell_path = "#{Rails.root}/lib/test_apk_generator"
  	test_sh = "#{shell_path}/test_.sh"
  	apk_url = "#{Rails.root}/public/#{apk.to_s}" # apk address
  	apk_name = apk_url.split("/").last

  	target_path = "/uploads/#{self.class.to_s.underscore}/test_apk/#{self.id}/"
  	target_folder_full_path = "#{Rails.root}/public#{target_path}"
		test_apk_target = "#{target_folder_full_path}NewTest#{apk_name}"
		result = `echo #{secret_password} | sudo -S sh #{test_sh} #{apk_url} #{test_apk_target} #{shell_path} #{target_folder_full_path}`

		# if succeed 
		test_apk_url = "#{target_path}NewTest#{apk_name}"
		update!(test_apk: test_apk_url)
  end

  def make_test_apk_folder
  	`mkdir #{Rails.root}/public/uploads/#{self.class.to_s.underscore}/test_apk/`
  end
end
