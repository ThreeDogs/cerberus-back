# == Schema Information
#
# Table name: apks
#
#  id            :integer          not null, primary key
#  apk           :string(255)
#  test_apk      :string(255)
#  test_bed_apk  :string(255)
#  package_name  :string(255)
#  activity_name :string(255)
#  min_sdk       :string(255)
#  target_sdk    :string(255)
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Apk < ActiveRecord::Base
	default_scope {order('created_at DESC')}
	before_create :make_test_apk_folder
	after_create :update_apk_attributes
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

	def get_device_list(test_bed_url = TEST_BED_URL)
    uri = URI("#{test_bed_url}/DeviceInfo")
    res = Net::HTTP.get(uri)
    res
  end

  def upload_date
  	created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  private

  def generate_test_apk
  	secret_password = "Zodlxj10"
  	shell_path = "#{Rails.root}/lib/test_apk_generator"
  	play_all_sh = "#{shell_path}/playAll.sh"
  	apk_url = "#{Rails.root}/public/#{apk.to_s}" # apk address
  	apk_name = apk_url.split("/").last
  	project_id = project.id

  	target_path = "/uploads/#{self.class.to_s.underscore}/test_apk/#{self.id}/"
  	target_bed_path = "/uploads/#{self.class.to_s.underscore}/test_bed_apk/#{self.id}/"

  	target_folder_full_path = "#{Rails.root}/public#{target_path}"
  	target_bed_folder_full_path = "#{Rails.root}/public#{target_bed_path}"

  	time_preffix = DateTime.now.strftime("%y%m%d%H%M")
		
		test_apk_file_name = "test#{time_preffix}_#{apk_name}"
		test_bed_apk_file_name = "test_bed#{time_preffix}_#{apk_name}"

		test_apk_target = "#{target_folder_full_path}#{test_apk_file_name}"
		test_bed_apk_target = "#{target_bed_folder_full_path}#{test_bed_apk_file_name}"

		result = `echo #{secret_password} | sudo -S sh #{play_all_sh} #{apk_url} #{test_apk_target} #{shell_path} #{target_folder_full_path} #{project_id} #{test_bed_apk_target} #{target_bed_folder_full_path} #{activity_name}`

		# if succeed 
		test_apk_url = "#{target_path}#{test_apk_file_name}"
		test_bed_apk_url = "#{target_bed_path}#{test_bed_apk_file_name}"

		update!(test_bed_apk: test_bed_apk_url,test_apk: test_apk_url)
  end

  def make_test_apk_folder
  	`mkdir #{Rails.root}/public/uploads/#{self.class.to_s.underscore}/test_apk/`
  	`mkdir #{Rails.root}/public/uploads/#{self.class.to_s.underscore}/test_bed_apk/`
  end

  def update_apk_attributes
		aapt = "#{Rails.root}/lib/android-tool/aapt"
		apk_url = "#{Rails.root}/public/#{apk.to_s}" # apk address

		# targetSdkVersion:'19'
		target_sdk_version_result = `#{aapt} dump badging #{apk_url} | grep 'targetSdkVersion'`
		# sdkVersion:'8'
		min_sdk_version_result = `#{aapt} dump badging #{apk_url} | grep 'sdkVersion'`
		# name='com.example.testandroid.MainActivity'
		main_activity_result = `#{aapt} dump badging #{apk_url} | grep 'launchable-activity: name' | cut -f2 -d" "`
		# com.example.testandroid
		package_name_result = `#{aapt} list -a "#{apk_url}" | sed -n "/^Package Group[^s]/s/.*name=//p"`

		target_sdk_version =  target_sdk_version_result.gsub(/\S*:'|'|\n/,'')
		min_sdk_version =  min_sdk_version_result.gsub(/\S*:'|'|\n/,'')
		main_activity =  main_activity_result.gsub(/\S*='|'|\n/,'')
		package_name = package_name_result.gsub(/\n/,'')

		update!(package_name: package_name, activity_name: main_activity, min_sdk: min_sdk_version, target_sdk: target_sdk_version)
  end
end
