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

class TestCode < ActiveRecord::Base
  after_create :import_code_class_callback
  belongs_to :project
  mount_uploader :import_code_java, CodeUploader

  def import_code_java_file_name(code_url = import_code_java.to_s)
    code_url.split("/").last
  end

  def import_code_file_name(code_url = import_code_class.to_s)
    code_url.split("/").last
  end

  def import_code_class_callback
    ImportCodeGenerateWorker.perform_async(id)
  end

  def import_code_generate
    secret_password = $ROOT_PASSWORD
    code_import_folder_path = "#{Rails.root}/lib/codeImport"
    target_path = "/uploads/#{self.class.to_s.underscore}/import_code_class/#{self.id}/"
    target_folder_full_path = "#{Rails.root}/public#{target_path}"
    compile_sh = "#{code_import_folder_path}/compile.sh"
    apk = Apk.all.first.apk.to_s
    sysout = `echo #{secret_password} | sudo -S sh #{compile_sh} #{code_import_folder_path} #{apk} #{import_code_java.to_s} #{id} #{target_folder_full_path}`
    result = sysout.match(/~~\S*~~/)[0]

    if result
      update!(import_code_class: "#{target_path}#{result}")
      puts "Success"
    else
      puts "Exception File Name is Error"
    end
  end
end
