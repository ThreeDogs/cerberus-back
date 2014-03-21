secret_password = "Zodlxj10"
root_path = "/Users/flowkater/repo/cerberus-back/lib/test_apk_generator"
test_sh = "#{root_path}/test_.sh"
apk = "./TestAndroid.apk"
test_apk = "./NewTestAndroid.apk"
result = `echo #{secret_password} | sudo -S sh #{test_sh} #{apk} #{test_apk} #{root_path}`

print result