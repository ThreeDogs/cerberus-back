@vingle_project = @user.projects.create!(name: "Vingle", icon: "/assets/vingle.png")

@apk1 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 1.weeks.ago)
@apk2 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 2.weeks.ago)
@apk3 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 3.weeks.ago)
@apk4 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 4.weeks.ago)
@apk5 = @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: 5.weeks.ago)


@total_report1 = @vingle_project.total_reports.create!(status: true, created_at: 1.days.ago, apk_id:@apk1.id)

@login_test = @vingle_project.test_scenarios.create!(name: "Login Test", description: "", rank: 0)

a_device = @total_report1.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR", device_key: "vingle_a_login_device")
a_detail = @total_report1.detail_reports.create!(app_version: "1.1.6.7", status: 1, running_time: 185, test_scenario_id: @login_test.id, device_key: "vingle_a_login_device")

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


@login_test.motion_events.create!(
activity_class: 'com.vingle.android.SplashActivity',
param:  '',
view: 'sign_in',
sleep: 0,
action_type: 'Click',
client_timestamp: 1403157161256
)
@login_test.motion_events.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'username',
sleep: 1766,
action_type: 'Click',
client_timestamp: 1403157163022
)

@login_test.motion_events.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'shtjdgus1090@gmail.com',
view: 'username',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403157165646
)

@login_test.motion_events.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  'asdf1090',
view: 'password',
sleep: 600,
action_type: 'EditText',
client_timestamp: 1403157169667
)

@login_test.motion_events.create!(
activity_class: 'com.vingle.android.loginActivity',
param:  '',
view: 'signin',
sleep: 1947,
action_type: 'Click',
client_timestamp: 1403157175295
)

@login_test.motion_events.create!(
activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
param:  '-2',
view: 'signin',
sleep: 1947,
action_type: 'AlertDialogClick',
client_timestamp: 1403157180030
)

