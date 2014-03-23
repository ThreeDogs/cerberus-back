secret_password = "Zodlxj10"
root_path = "/Users/flowkater/repo/cerberus-back/lib/test_apk_generator"
test_sh = "#{root_path}/test_.sh"

apk_path = "/Users/flowkater/repo/cerberus-back/lib/"
apk = "#{apk_path}/tasks/TestAndroid.apk"
# target = "./2"
test_apk = "#{apk_path}/tasks/1/NewTestAndroid.apk"


result = `echo #{secret_password} | sudo -S sh #{test_sh} #{apk} #{test_apk} #{root_path} #{apk_path}/tasks/1/`

print result