@vingle_project = @user.projects.create!(name: "Vingle", icon: "/assets/vingle.png")

@apk1 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 1.weeks.ago)
@apk2 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 2.weeks.ago)
@apk3 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 3.weeks.ago)
@apk4 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 4.weeks.ago)
@apk5 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 5.weeks.ago)

@login_test = @vingle_project.test_scenarios.create!(name: "Login Test", description: "", rank: 0)
@basic_test1 = @vingle_project.test_scenarios.create!(name: "Basic List View Test", description: "", rank: 0)
@basic_test2 = @vingle_project.test_scenarios.create!(name: "Custom Button Test", description: "", rank: 1)
@basic_test3 = @vingle_project.test_scenarios.create!(name: "Collection Test", description: "", rank: 2)
@basic_test4 = @vingle_project.test_scenarios.create!(name: "Interest Test", description: "", rank: 2)


10.times do 

@total_report1 = @vingle_project.total_reports.create!(status: true, created_at: 1.days.ago, apk_id:@apk1.id)

@total_report1.scenarioships.create!(test_scenario_id: @login_test.id)
@total_report1.scenarioships.create!(test_scenario_id: @basic_test1.id)
@total_report1.scenarioships.create!(test_scenario_id: @basic_test2.id)
@total_report1.scenarioships.create!(test_scenario_id: @basic_test3.id)
@total_report1.scenarioships.create!(test_scenario_id: @basic_test4.id)

@total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR", device_key: "vingle_a_login_device")
@total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHV-E250S",os_version: "4.1",country: "KR", device_key: "vingle_b_login_device")
@total_report1.devices.create!(brand: "google",cpu: "armeabi-v7a",model: "Nexus7",os_version: "4.3",country: "KR", device_key: "vingle_c_login_device")
@total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHW-M130K",os_version:"2.1",country:"KR", device_key: "vingle_d_login_device")
@total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model:"SHW-M130L",os_version: "4.0",country: "KR", device_key: "vingle_e_login_device")
@total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SGH-I897",os_version:"4.2",country: "KR", device_key: "vingle_f_login_device")

################################################################################################################################

["a","b","c","d","e","f"].each do |s|
	a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 185, test_scenario_id: @login_test.id, device_key: "vingle_#{s}_login_device")

a_detail.memory_infos.create!(
		mem_total:2498820,
		dalvik_heap_alloc:2278593.12,
		native_heap_size:2498813.11,
		dalvik_heap_size:6.89,
		native_heap_alloc:6.88,
		mem_alloc:2278600,
		client_timestamp:1503157161257
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157163023
		)
		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165647
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165648
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1403091032882
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165649
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165750
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165900
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166200
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166400
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166600
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166800
		)


		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157161257
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157163023
		)

		a_detail.cpu_infos.create!(
		usage: 16,
		client_timestamp: 1503157165647
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157165648
		)

		a_detail.cpu_infos.create!(
		usage: 12,
		client_timestamp: 1503157165649
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165650
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165750
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165900
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157166200
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166400
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166600
		)

		a_detail.cpu_infos.create!(
		usage: 21,
		client_timestamp: 1503157166800
		)


		a_detail.network_infos.create!(
		response_size: 1806,
		request_size: 906,
		client_timestamp:1503157161257
		)

		a_detail.network_infos.create!(
		response_size: 1907,
		request_size: 201,
		client_timestamp:1503157163023
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165647
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165648
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1403091032882
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165649
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 16506,
		client_timestamp:1503157165750
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165900
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166200
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166400
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 5006,
		client_timestamp:1503157166600
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4006,
		client_timestamp:1503157166800
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 185,
		client_timestamp: 1503157161257
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 85,
		client_timestamp: 1503157163023
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 67,
		client_timestamp: 1503157165647
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 56,
		client_timestamp: 1503157165648
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 45,
		client_timestamp: 1403091032882
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 189,
		client_timestamp: 1503157165649
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 98,
		client_timestamp: 1503157165750
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 218,
		client_timestamp: 1503157165900
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 207,
		client_timestamp: 1503157166200
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166400
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166600
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 454,
		client_timestamp: 1503157166800
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157165649,
		load_finish_timestamp: 1503157166649,
		view_id: "com.vingle.android.SplashActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157169649,
		load_finish_timestamp: 1503157170649,
		view_id: "com.vingle.android.loginActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157179649,
		load_finish_timestamp: 1503157180649,
		view_id: "com.vingle.android.AbsGridFragment",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180649,
		load_finish_timestamp: 1503157181649,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157182949,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157181049,
		view_id: "com.vingle.android.VingleImageView",
		)



		a_detail.cpu_methods.create!(
		tree_key: 1,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "onCreate",
		start_timestamp: 1503157161056,
		end_timestamp: 1503157166649
		)

		a_detail.cpu_methods.create!(
		tree_key: 2,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "isLoginCheck",
		start_timestamp: 1503157161066,
		end_timestamp: 1503157166639
		)

		a_detail.cpu_methods.create!(
		tree_key: 3,
		parent_key: 2,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadSession",
		start_timestamp: 1503157161166,
		end_timestamp: 1503157166638
		)

		a_detail.cpu_methods.create!(
		tree_key: 4,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 5,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadBgService",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 6,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "openDatabase",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 7,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 8,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 9,
		parent_key: 8,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "startLoginFrame",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 10,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 11,
		parent_key: 10,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 12,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 13,
		parent_key: 0,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 14,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setFragment",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 15,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 16,
		parent_key: 15,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 17,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 18,
		parent_key: 17,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 19,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "isUpdateCheck",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 20,
		parent_key: 19,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "showDialog",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.SplashActivity',
		param:  '',
		view: 'sign_in',
		sleep: 0,
		action_type: 'Click',
		client_timestamp: 1503157161256
		)

		Screen.create!(client_timestamp: 1503157161256, image: "/assets/1503157161256.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'username',
		sleep: 1766,
		action_type: 'Click',
		client_timestamp: 1503157163022)

		Screen.create!(client_timestamp: 1503157163022, image: "/assets/1503157163022.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'shtjdgus1090@gmail.com',
		view: 'username',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157165646)

		Screen.create!(client_timestamp: 1503157165646, image: "/assets/1503157165646.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'asdf1090',
		view: 'password',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157169667)

		Screen.create!(client_timestamp: 1503157169667, image: "/assets/1503157169667.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'signin',
		sleep: 1947,
		action_type: 'Click',
		client_timestamp: 1503157175295)

		Screen.create!(client_timestamp: 1503157175295, image: "/assets/1503157175295.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
		param:  '-2',
		view: 'signin',
		sleep: 1947,
		action_type: 'AlertDialogClick',
		client_timestamp: 1503157180030)

		Screen.create!(client_timestamp: 1503157180030, image: "/assets/1503157180030.jpg")
end


################################################################################################################

["a","b","c","d","e","f"].each do |s|
	a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 185, test_scenario_id: @basic_test1.id, device_key: "vingle_#{s}_login_device")
#memory_infos

a_detail.memory_infos.create!(
mem_total:2498820,
dalvik_heap_alloc:2278593.12,
native_heap_size:2498813.11,
dalvik_heap_size:6.89,
native_heap_alloc:6.88,
mem_alloc:2278600,
client_timestamp:1403172537032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172538032
)
a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172539032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172540032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172541032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172542032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172543032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172544032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172545032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172546032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172547032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172548032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172549032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172550032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172537032
)

a_detail.cpu_infos.create!(
usage: 17,
client_timestamp: 1403172538032
)

a_detail.cpu_infos.create!(
usage: 16,
client_timestamp: 1403172539032
)

a_detail.cpu_infos.create!(
usage: 17,
client_timestamp: 1403172540032
)

a_detail.cpu_infos.create!(
usage: 12,
client_timestamp: 1403172541032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172542032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172543032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172544032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172545032
)

a_detail.cpu_infos.create!(
usage: 20,
client_timestamp: 1403172546032
)

a_detail.cpu_infos.create!(
usage: 20,
client_timestamp: 1403172547032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172548032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172549032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172550032
)


a_detail.network_infos.create!(
response_size: 1806,
request_size: 906,
client_timestamp:1403172537032
)

a_detail.network_infos.create!(
response_size: 1907,
request_size: 201,
client_timestamp:1403172538032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172539032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172540032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172541032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 4506,
client_timestamp:1403172542032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 16506,
client_timestamp:1403172543032
)

a_detail.network_infos.create!(
response_size: 1906000,
request_size: 4406,
client_timestamp:1403172544032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 4246,
client_timestamp:1403172545032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 6006,
client_timestamp:1403172546032
)

a_detail.network_infos.create!(
response_size: 2907000,
request_size: 5006,
client_timestamp:1403172547032
)

a_detail.network_infos.create!(
response_size: 2707000,
request_size: 4006,
client_timestamp:1403172548032
)

a_detail.network_infos.create!(
response_size: 2700000,
request_size: 4006,
client_timestamp:1403172549032
)

a_detail.network_infos.create!(
response_size: 807000,
request_size: 4006,
client_timestamp:1403172550032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 185,
client_timestamp: 1403172537032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 85,
client_timestamp: 1403172538032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 67,
client_timestamp: 1403172539032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 56,
client_timestamp: 1403172540032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 45,
client_timestamp: 1403172541032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 189,
client_timestamp: 1403172542032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 98,
client_timestamp: 1403172543032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 218,
client_timestamp: 1403172544032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403172545032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 354,
client_timestamp: 1403172546032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 354,
client_timestamp: 1403172547032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 454,
client_timestamp: 1403172548032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 424,
client_timestamp: 1403172549032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 554,
client_timestamp: 1403172550032
)


a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157165649,
load_finish_timestamp: 1403157166649,
view_id: "com.vingle.android.SplashActivity",
)

a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157169649,
load_finish_timestamp: 1403157170649,
view_id: "com.vingle.android.loginActivity",
)

a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157179649,
load_finish_timestamp: 1403157180649,
view_id: "com.vingle.android.AbsGridFragment",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180649,
load_finish_timestamp: 1403157181649,
view_id: "com.vingle.android.VingleImageView",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180849,
load_finish_timestamp: 1403157182949,
view_id: "com.vingle.android.VingleImageView",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180849,
load_finish_timestamp: 1403157181049,
view_id: "com.vingle.android.VingleImageView",
)



a_detail.cpu_methods.create!(
tree_key: 1,
parent_key: 0,
class_name: "com.vingle.android.SplashActivity",
method_name: "onCreate",
start_timestamp: 1403157161056,
end_timestamp: 1403157166649
)

a_detail.cpu_methods.create!(
tree_key: 2,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "isLoginCheck",
start_timestamp: 1403157161066,
end_timestamp: 1403157166639
)

a_detail.cpu_methods.create!(
tree_key: 3,
parent_key: 2,
class_name: "com.vingle.android.SplashActivity",
method_name: "loadSession",
start_timestamp: 1403157161166,
end_timestamp: 1403157166638
)

a_detail.cpu_methods.create!(
tree_key: 4,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "setContentView",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 5,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "loadBgService",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 6,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "openDatabase",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 7,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "setContentView",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 8,
parent_key: 0,
class_name: "com.vingle.android.SplashActivity$1",
method_name: "onClick",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 9,
parent_key: 8,
class_name: "com.vingle.android.SplashActivity$1",
method_name: "startLoginFrame",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 10,
parent_key: 0,
class_name: "com.vingle.android.LoginActivity",
method_name: "onCreate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 11,
parent_key: 10,
class_name: "com.vingle.android.LoginActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 12,
parent_key: 0,
class_name: "com.vingle.android.LoginActivity$1",
method_name: "onClick",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 13,
parent_key: 0,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCreate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 14,
parent_key: 13,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setFragment",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 15,
parent_key: 14,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCrate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 16,
parent_key: 15,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 17,
parent_key: 14,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCrate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 18,
parent_key: 17,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 19,
parent_key: 13,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "isUpdateCheck",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 20,
parent_key: 19,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "showDialog",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)


#motion_event_infos

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.SplashActivity',
param:  '',
view: 'sign_in',
sleep: 0,
action_type: 'Click',
client_timestamp: 1403172537032
)

Screen.create!(client_timestamp: 1403172537032, image: "/assets/1403172537032.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'username',
sleep: 1766,
action_type: 'Click',
client_timestamp: 1403172538349
)

Screen.create!(client_timestamp: 1403172538349, image: "/assets/1403172538349.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'shtjdgus1090@gmail.com',
view: 'username',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403172540747
)

Screen.create!(client_timestamp: 1403172540747, image: "/assets/1403172540747.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'asdf1090',
view: 'password',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403172543043
)

Screen.create!(client_timestamp: 1403172543043, image: "/assets/1403172543043.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'signin',
sleep: 1947,
action_type: 'Click',
client_timestamp: 1403172546636
)

Screen.create!(client_timestamp: 1403172546636, image: "/assets/1403172546636.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
param:  '-2',
view: 'signin',
sleep: 1947,
action_type: 'AlertDialogClick',
client_timestamp: 1403172551145
)

Screen.create!(client_timestamp: 1403172551145, image: "/assets/1403172551145.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
param:  '677,1373,782,93',
view: 'home_interest_grid',
sleep: 2123,
action_type: 'drag',
client_timestamp: 1403172554894
)

Screen.create!(client_timestamp: 1403172554894, image: "/assets/1403172554894.jpg")
end


################################################################################################################################

["a","b","c","d","e","f"].each do |s|
	a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 185, test_scenario_id: @basic_test2.id, device_key: "vingle_#{s}_login_device")

a_detail.memory_infos.create!(
		mem_total:2498820,
		dalvik_heap_alloc:2278593.12,
		native_heap_size:2498813.11,
		dalvik_heap_size:6.89,
		native_heap_alloc:6.88,
		mem_alloc:2278600,
		client_timestamp:1503157161257
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157163023
		)
		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165647
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165648
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1403091032882
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165649
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165750
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165900
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166200
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166400
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166600
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166800
		)


		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157161257
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157163023
		)

		a_detail.cpu_infos.create!(
		usage: 16,
		client_timestamp: 1503157165647
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157165648
		)

		a_detail.cpu_infos.create!(
		usage: 12,
		client_timestamp: 1503157165649
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165650
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165750
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165900
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157166200
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166400
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166600
		)

		a_detail.cpu_infos.create!(
		usage: 21,
		client_timestamp: 1503157166800
		)


		a_detail.network_infos.create!(
		response_size: 1806,
		request_size: 906,
		client_timestamp:1503157161257
		)

		a_detail.network_infos.create!(
		response_size: 1907,
		request_size: 201,
		client_timestamp:1503157163023
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165647
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165648
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1403091032882
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165649
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 16506,
		client_timestamp:1503157165750
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165900
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166200
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166400
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 5006,
		client_timestamp:1503157166600
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4006,
		client_timestamp:1503157166800
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 185,
		client_timestamp: 1503157161257
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 85,
		client_timestamp: 1503157163023
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 67,
		client_timestamp: 1503157165647
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 56,
		client_timestamp: 1503157165648
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 45,
		client_timestamp: 1403091032882
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 189,
		client_timestamp: 1503157165649
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 98,
		client_timestamp: 1503157165750
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 218,
		client_timestamp: 1503157165900
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 207,
		client_timestamp: 1503157166200
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166400
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166600
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 454,
		client_timestamp: 1503157166800
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157165649,
		load_finish_timestamp: 1503157166649,
		view_id: "com.vingle.android.SplashActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157169649,
		load_finish_timestamp: 1503157170649,
		view_id: "com.vingle.android.loginActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157179649,
		load_finish_timestamp: 1503157180649,
		view_id: "com.vingle.android.AbsGridFragment",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180649,
		load_finish_timestamp: 1503157181649,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157182949,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157181049,
		view_id: "com.vingle.android.VingleImageView",
		)



		a_detail.cpu_methods.create!(
		tree_key: 1,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "onCreate",
		start_timestamp: 1503157161056,
		end_timestamp: 1503157166649
		)

		a_detail.cpu_methods.create!(
		tree_key: 2,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "isLoginCheck",
		start_timestamp: 1503157161066,
		end_timestamp: 1503157166639
		)

		a_detail.cpu_methods.create!(
		tree_key: 3,
		parent_key: 2,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadSession",
		start_timestamp: 1503157161166,
		end_timestamp: 1503157166638
		)

		a_detail.cpu_methods.create!(
		tree_key: 4,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 5,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadBgService",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 6,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "openDatabase",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 7,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 8,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 9,
		parent_key: 8,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "startLoginFrame",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 10,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 11,
		parent_key: 10,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 12,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 13,
		parent_key: 0,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 14,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setFragment",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 15,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 16,
		parent_key: 15,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 17,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 18,
		parent_key: 17,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 19,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "isUpdateCheck",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 20,
		parent_key: 19,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "showDialog",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.SplashActivity',
		param:  '',
		view: 'sign_in',
		sleep: 0,
		action_type: 'Click',
		client_timestamp: 1503157161256
		)

		Screen.create!(client_timestamp: 1503157161256, image: "/assets/1503157161256.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'username',
		sleep: 1766,
		action_type: 'Click',
		client_timestamp: 1503157163022)

		Screen.create!(client_timestamp: 1503157163022, image: "/assets/1503157163022.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'shtjdgus1090@gmail.com',
		view: 'username',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157165646)

		Screen.create!(client_timestamp: 1503157165646, image: "/assets/1503157165646.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'asdf1090',
		view: 'password',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157169667)

		Screen.create!(client_timestamp: 1503157169667, image: "/assets/1503157169667.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'signin',
		sleep: 1947,
		action_type: 'Click',
		client_timestamp: 1503157175295)

		Screen.create!(client_timestamp: 1503157175295, image: "/assets/1503157175295.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
		param:  '-2',
		view: 'signin',
		sleep: 1947,
		action_type: 'AlertDialogClick',
		client_timestamp: 1503157180030)

		Screen.create!(client_timestamp: 1503157180030, image: "/assets/1503157180030.jpg")
end

################################################################################################################

["a","b","c","d","e","f"].each do |s|
	a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 345, test_scenario_id: @basic_test3.id, device_key: "vingle_#{s}_login_device")
#memory_infos

a_detail.memory_infos.create!(
mem_total:2498820,
dalvik_heap_alloc:2278593.12,
native_heap_size:2498813.11,
dalvik_heap_size:6.89,
native_heap_alloc:6.88,
mem_alloc:2278600,
client_timestamp:1403172537032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172538032
)
a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172539032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172540032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172541032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172542032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172543032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172544032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172545032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172546032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2498813.11,
dalvik_heap_size: 6.89,
native_heap_alloc: 6.88,
mem_alloc: 2278600,
client_timestamp: 1403172547032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172548032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172549032
)

a_detail.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2278593.12,
native_heap_size: 2289780.88,
dalvik_heap_size: 7.36,
native_heap_alloc: 7.12,
mem_alloc: 2289788,
client_timestamp: 1403172550032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172537032
)

a_detail.cpu_infos.create!(
usage: 17,
client_timestamp: 1403172538032
)

a_detail.cpu_infos.create!(
usage: 16,
client_timestamp: 1403172539032
)

a_detail.cpu_infos.create!(
usage: 17,
client_timestamp: 1403172540032
)

a_detail.cpu_infos.create!(
usage: 12,
client_timestamp: 1403172541032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172542032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172543032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172544032
)

a_detail.cpu_infos.create!(
usage: 10,
client_timestamp: 1403172545032
)

a_detail.cpu_infos.create!(
usage: 20,
client_timestamp: 1403172546032
)

a_detail.cpu_infos.create!(
usage: 20,
client_timestamp: 1403172547032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172548032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172549032
)

a_detail.cpu_infos.create!(
usage: 21,
client_timestamp: 1403172550032
)


a_detail.network_infos.create!(
response_size: 1806,
request_size: 906,
client_timestamp:1403172537032
)

a_detail.network_infos.create!(
response_size: 1907,
request_size: 201,
client_timestamp:1403172538032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172539032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172540032
)

a_detail.network_infos.create!(
response_size: 0,
request_size: 0,
client_timestamp:1403172541032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 4506,
client_timestamp:1403172542032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 16506,
client_timestamp:1403172543032
)

a_detail.network_infos.create!(
response_size: 1906000,
request_size: 4406,
client_timestamp:1403172544032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 4246,
client_timestamp:1403172545032
)

a_detail.network_infos.create!(
response_size: 1907000,
request_size: 6006,
client_timestamp:1403172546032
)

a_detail.network_infos.create!(
response_size: 2907000,
request_size: 5006,
client_timestamp:1403172547032
)

a_detail.network_infos.create!(
response_size: 2707000,
request_size: 4006,
client_timestamp:1403172548032
)

a_detail.network_infos.create!(
response_size: 2700000,
request_size: 4006,
client_timestamp:1403172549032
)

a_detail.network_infos.create!(
response_size: 807000,
request_size: 4006,
client_timestamp:1403172550032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 185,
client_timestamp: 1403172537032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 85,
client_timestamp: 1403172538032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 67,
client_timestamp: 1403172539032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 56,
client_timestamp: 1403172540032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 45,
client_timestamp: 1403172541032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 189,
client_timestamp: 1403172542032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 98,
client_timestamp: 1403172543032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 218,
client_timestamp: 1403172544032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403172545032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 354,
client_timestamp: 1403172546032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 354,
client_timestamp: 1403172547032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 454,
client_timestamp: 1403172548032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 424,
client_timestamp: 1403172549032
)

a_detail.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 554,
client_timestamp: 1403172550032
)


a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157165649,
load_finish_timestamp: 1403157166649,
view_id: "com.vingle.android.SplashActivity",
)

a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157169649,
load_finish_timestamp: 1403157170649,
view_id: "com.vingle.android.loginActivity",
)

a_detail.frame_draw_times.create!(
view_type: "Activity" ,
load_start_timestamp: 1403157179649,
load_finish_timestamp: 1403157180649,
view_id: "com.vingle.android.AbsGridFragment",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180649,
load_finish_timestamp: 1403157181649,
view_id: "com.vingle.android.VingleImageView",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180849,
load_finish_timestamp: 1403157182949,
view_id: "com.vingle.android.VingleImageView",
)

a_detail.frame_draw_times.create!(
view_type: "Image" ,
load_start_timestamp: 1403157180849,
load_finish_timestamp: 1403157181049,
view_id: "com.vingle.android.VingleImageView",
)



a_detail.cpu_methods.create!(
tree_key: 1,
parent_key: 0,
class_name: "com.vingle.android.SplashActivity",
method_name: "onCreate",
start_timestamp: 1403157161056,
end_timestamp: 1403157166649
)

a_detail.cpu_methods.create!(
tree_key: 2,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "isLoginCheck",
start_timestamp: 1403157161066,
end_timestamp: 1403157166639
)

a_detail.cpu_methods.create!(
tree_key: 3,
parent_key: 2,
class_name: "com.vingle.android.SplashActivity",
method_name: "loadSession",
start_timestamp: 1403157161166,
end_timestamp: 1403157166638
)

a_detail.cpu_methods.create!(
tree_key: 4,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "setContentView",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 5,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "loadBgService",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 6,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "openDatabase",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 7,
parent_key: 1,
class_name: "com.vingle.android.SplashActivity",
method_name: "setContentView",
start_timestamp: 1403157166638,
end_timestamp: 1403157165649
)

a_detail.cpu_methods.create!(
tree_key: 8,
parent_key: 0,
class_name: "com.vingle.android.SplashActivity$1",
method_name: "onClick",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 9,
parent_key: 8,
class_name: "com.vingle.android.SplashActivity$1",
method_name: "startLoginFrame",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 10,
parent_key: 0,
class_name: "com.vingle.android.LoginActivity",
method_name: "onCreate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 11,
parent_key: 10,
class_name: "com.vingle.android.LoginActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 12,
parent_key: 0,
class_name: "com.vingle.android.LoginActivity$1",
method_name: "onClick",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 13,
parent_key: 0,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCreate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 14,
parent_key: 13,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setFragment",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 15,
parent_key: 14,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCrate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 16,
parent_key: 15,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 17,
parent_key: 14,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "onCrate",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 18,
parent_key: 17,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "setContentView",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 19,
parent_key: 13,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "isUpdateCheck",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)

a_detail.cpu_methods.create!(
tree_key: 20,
parent_key: 19,
class_name: "com.vingle.android.sp.MainRootFragmentActivity",
method_name: "showDialog",
start_timestamp: 1403157160256,
end_timestamp: 1403157161000
)


#motion_event_infos

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.SplashActivity',
param:  '',
view: 'sign_in',
sleep: 0,
action_type: 'Click',
client_timestamp: 1403172537032
)

Screen.create!(client_timestamp: 1403172537032, image: "/assets/1403172537032.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'username',
sleep: 1766,
action_type: 'Click',
client_timestamp: 1403172538349
)

Screen.create!(client_timestamp: 1403172538349, image: "/assets/1403172538349.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'shtjdgus1090@gmail.com',
view: 'username',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403172540747
)

Screen.create!(client_timestamp: 1403172540747, image: "/assets/1403172540747.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'asdf1090',
view: 'password',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403172543043
)

Screen.create!(client_timestamp: 1403172543043, image: "/assets/1403172543043.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'signin',
sleep: 1947,
action_type: 'Click',
client_timestamp: 1403172546636
)

Screen.create!(client_timestamp: 1403172546636, image: "/assets/1403172546636.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
param:  '-2',
view: 'signin',
sleep: 1947,
action_type: 'AlertDialogClick',
client_timestamp: 1403172551145
)

Screen.create!(client_timestamp: 1403172551145, image: "/assets/1403172551145.jpg")

a_detail.motion_event_infos.create!(
activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
param:  '677,1373,782,93',
view: 'home_interest_grid',
sleep: 2123,
action_type: 'drag',
client_timestamp: 1403172554894
)

Screen.create!(client_timestamp: 1403172554894, image: "/assets/1403172554894.jpg")
end


################################################################################################################################

["a","b","c","d","e","f"].each do |s|
	a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 345, test_scenario_id: @basic_test4.id, device_key: "vingle_#{s}_login_device")

a_detail.memory_infos.create!(
		mem_total:2498820,
		dalvik_heap_alloc:2278593.12,
		native_heap_size:2498813.11,
		dalvik_heap_size:6.89,
		native_heap_alloc:6.88,
		mem_alloc:2278600,
		client_timestamp:1503157161257
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157163023
		)
		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165647
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165648
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1403091032882
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165649
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157165750
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157165900
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166200
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166400
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2498813.11,
		dalvik_heap_size: 6.89,
		native_heap_alloc: 6.88,
		mem_alloc: 2278600,
		client_timestamp: 1503157166600
		)

		a_detail.memory_infos.create!(
		mem_total: 2498820,
		dalvik_heap_alloc: 2278593.12,
		native_heap_size: 2289780.88,
		dalvik_heap_size: 7.36,
		native_heap_alloc: 7.12,
		mem_alloc: 2289788,
		client_timestamp: 1503157166800
		)


		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157161257
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157163023
		)

		a_detail.cpu_infos.create!(
		usage: 16,
		client_timestamp: 1503157165647
		)

		a_detail.cpu_infos.create!(
		usage: 17,
		client_timestamp: 1503157165648
		)

		a_detail.cpu_infos.create!(
		usage: 12,
		client_timestamp: 1503157165649
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165650
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165750
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157165900
		)

		a_detail.cpu_infos.create!(
		usage: 10,
		client_timestamp: 1503157166200
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166400
		)

		a_detail.cpu_infos.create!(
		usage: 20,
		client_timestamp: 1503157166600
		)

		a_detail.cpu_infos.create!(
		usage: 21,
		client_timestamp: 1503157166800
		)


		a_detail.network_infos.create!(
		response_size: 1806,
		request_size: 906,
		client_timestamp:1503157161257
		)

		a_detail.network_infos.create!(
		response_size: 1907,
		request_size: 201,
		client_timestamp:1503157163023
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165647
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1503157165648
		)

		a_detail.network_infos.create!(
		response_size: 0,
		request_size: 0,
		client_timestamp:1403091032882
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165649
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 16506,
		client_timestamp:1503157165750
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157165900
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166200
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4506,
		client_timestamp:1503157166400
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 5006,
		client_timestamp:1503157166600
		)

		a_detail.network_infos.create!(
		response_size: 1907000,
		request_size: 4006,
		client_timestamp:1503157166800
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 185,
		client_timestamp: 1503157161257
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 85,
		client_timestamp: 1503157163023
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 67,
		client_timestamp: 1503157165647
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 56,
		client_timestamp: 1503157165648
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 45,
		client_timestamp: 1403091032882
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 189,
		client_timestamp: 1503157165649
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 98,
		client_timestamp: 1503157165750
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 218,
		client_timestamp: 1503157165900
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 207,
		client_timestamp: 1503157166200
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166400
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 354,
		client_timestamp: 1503157166600
		)

		a_detail.battery_infos.create!(
		wifi: 411,
		threeg: 0,
		lcd: 720,
		gps: 0,
		sound: 0,
		cpu: 454,
		client_timestamp: 1503157166800
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157165649,
		load_finish_timestamp: 1503157166649,
		view_id: "com.vingle.android.SplashActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157169649,
		load_finish_timestamp: 1503157170649,
		view_id: "com.vingle.android.loginActivity",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Activity" ,
		load_start_timestamp: 1503157179649,
		load_finish_timestamp: 1503157180649,
		view_id: "com.vingle.android.AbsGridFragment",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180649,
		load_finish_timestamp: 1503157181649,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157182949,
		view_id: "com.vingle.android.VingleImageView",
		)

		a_detail.frame_draw_times.create!(
		view_type: "Image" ,
		load_start_timestamp: 1503157180849,
		load_finish_timestamp: 1503157181049,
		view_id: "com.vingle.android.VingleImageView",
		)



		a_detail.cpu_methods.create!(
		tree_key: 1,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "onCreate",
		start_timestamp: 1503157161056,
		end_timestamp: 1503157166649
		)

		a_detail.cpu_methods.create!(
		tree_key: 2,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "isLoginCheck",
		start_timestamp: 1503157161066,
		end_timestamp: 1503157166639
		)

		a_detail.cpu_methods.create!(
		tree_key: 3,
		parent_key: 2,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadSession",
		start_timestamp: 1503157161166,
		end_timestamp: 1503157166638
		)

		a_detail.cpu_methods.create!(
		tree_key: 4,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 5,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "loadBgService",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 6,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "openDatabase",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 7,
		parent_key: 1,
		class_name: "com.vingle.android.SplashActivity",
		method_name: "setContentView",
		start_timestamp: 1503157166638,
		end_timestamp: 1503157165649
		)

		a_detail.cpu_methods.create!(
		tree_key: 8,
		parent_key: 0,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 9,
		parent_key: 8,
		class_name: "com.vingle.android.SplashActivity$1",
		method_name: "startLoginFrame",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 10,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 11,
		parent_key: 10,
		class_name: "com.vingle.android.LoginActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 12,
		parent_key: 0,
		class_name: "com.vingle.android.LoginActivity$1",
		method_name: "onClick",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 13,
		parent_key: 0,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCreate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 14,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setFragment",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 15,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 16,
		parent_key: 15,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 17,
		parent_key: 14,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "onCrate",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 18,
		parent_key: 17,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "setContentView",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 19,
		parent_key: 13,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "isUpdateCheck",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.cpu_methods.create!(
		tree_key: 20,
		parent_key: 19,
		class_name: "com.vingle.android.sp.MainRootFragmentActivity",
		method_name: "showDialog",
		start_timestamp: 1503157160256,
		end_timestamp: 1503157161000
		)

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.SplashActivity',
		param:  '',
		view: 'sign_in',
		sleep: 0,
		action_type: 'Click',
		client_timestamp: 1503157161256
		)

		Screen.create!(client_timestamp: 1503157161256, image: "/assets/1503157161256.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'username',
		sleep: 1766,
		action_type: 'Click',
		client_timestamp: 1503157163022)

		Screen.create!(client_timestamp: 1503157163022, image: "/assets/1503157163022.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'shtjdgus1090@gmail.com',
		view: 'username',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157165646)

		Screen.create!(client_timestamp: 1503157165646, image: "/assets/1503157165646.jpg")

		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  'asdf1090',
		view: 'password',
		sleep: 600,
		action_type: 'EditText',
		client_timestamp: 1503157169667)

		Screen.create!(client_timestamp: 1503157169667, image: "/assets/1503157169667.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.loginActivity',
		param:  '',
		view: 'signin',
		sleep: 1947,
		action_type: 'Click',
		client_timestamp: 1503157175295)

		Screen.create!(client_timestamp: 1503157175295, image: "/assets/1503157175295.jpg")


		a_detail.motion_event_infos.create!(
		activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
		param:  '-2',
		view: 'signin',
		sleep: 1947,
		action_type: 'AlertDialogClick',
		client_timestamp: 1503157180030)

		Screen.create!(client_timestamp: 1503157180030, image: "/assets/1503157180030.jpg")
end
end