@bitmap_project = @user.projects.create!(name: "Bitmap", icon: "")

@apk_no_cache = @bitmap_project.apks.create!(apk: "BitmapFunNoCache.apk" ,test_apk: "test_BitmapFunNoCache.apk",test_bed_apk:"test_bed_BitmapFunNoCache.apk", package_name: "com.example.android.bitmapfun" , activity_name: "com.example.android.bitmapfun.ui.ImageGridActivity" ,min_sdk:8, target_sdk:19, created_at: 1.days.ago)

@apk_cache = @bitmap_project.apks.create!(apk: "BitmapFunNoCache.apk" ,test_apk: "test_BitmapFunNoCache.apk",test_bed_apk:"test_bed_BitmapFunNoCache.apk", package_name: "com.example.android.bitmapfun" , activity_name: "com.example.android.bitmapfun.ui.ImageGridActivity" ,min_sdk:8, target_sdk:19, created_at: 1.days.ago)


@test = @bitmap_project.test_scenarios.create!(name: "Memory Leak Test", description: "Bitmap Load Memory Leak Test", rank: 0)

@total_report = @bitmap_project.total_reports.create!(status: true, created_at: 1.days.ago, apk_id:@apk_no_cache.id)

@memory_crash = @total_report.crashes.create!(error_name: "java.lang.OutOfMemoryError",error_line: 256,description: "at android.graphics.Bitmap.nativeCreateScaledBitmap(Native Method) at android.graphics.Bitmap.createScaledBitmap(Bitmap.java:744) at de.vauge.mb.Utils.getResizedBitmap(Utils.java:56)  at de.vauge.mb.MenuView.initialize(MenuView.java:74)  at de.vauge.mb.MenuView$1.handleMessage(MenuView.java:137) at android.os.Handler.dispatchMessage(Handler.java:99)  at android.os.Looper.loop(Looper.java:156) at android.app.ActivityThread.main(ActivityThread.java:5045) at java.lang.reflect.Method.invokeNative(Native Method) at java.lang.reflect.Method.invoke(Method.java:511) at com.android.internal.os.ZygoteInit$MethodAndArgsCaller.run(ZygoteInit.java:784) at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:551)  at dalvik.system.NativeStart.main(Native Method)")

@total_report.scenarioships.create!(test_scenario_id: @test.id)

@total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR", device_key: "bitmap_test_device")

d_no = @total_report.detail_reports.create!(app_version: "1.0", status: -1, running_time: 1630, test_scenario_id: @test.id, device_key: "bitmap_test_device", crash_id: @memory_crash.id)


d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 140,
client_timestamp: 1403096883775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 64,
client_timestamp: 1403096884775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 46,
client_timestamp: 1403096885775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 26,
client_timestamp: 1403096886775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 40,
client_timestamp: 1403096887775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 23,
client_timestamp: 1403096888775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 216,
client_timestamp: 1403096889775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403096890775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 208,
client_timestamp: 1403096891775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 227,
client_timestamp: 1403096892775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 114,
client_timestamp: 1403096893775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 44,
client_timestamp: 1403096894775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 78,
client_timestamp: 1403096895775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 137,
client_timestamp: 1403096896775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 221,
client_timestamp: 1403096897775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 222,
client_timestamp: 1403096898775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 205,
client_timestamp: 1403096899775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403096900775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 41,
client_timestamp: 1403096910775
)

d_no.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 11,
client_timestamp: 1403096914303
)






d_no.cpu_infos.create!(
usage: 52,
client_timestamp: 1403096883775
)

d_no.cpu_infos.create!(
usage: 26,
client_timestamp: 1403096895437
)

d_no.cpu_infos.create!(
usage: 37,
client_timestamp: 1403096896437
)

d_no.cpu_infos.create!(
usage: 20,
client_timestamp: 1403096897305
)

d_no.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096898924
)

d_no.cpu_infos.create!(
usage: 19,
client_timestamp: 1403096900703
)

d_no.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096902259
)

d_no.cpu_infos.create!(
usage: 25,
client_timestamp: 1403096902759
)

d_no.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096883275
)

d_no.cpu_infos.create!(
usage: 30,
client_timestamp: 1403096883775
)

d_no.cpu_infos.create!(
usage: 28,
client_timestamp: 1403096905537
)

d_no.cpu_infos.create!(
usage: 38,
client_timestamp: 1403096907031
)

d_no.cpu_infos.create!(
usage: 15,
client_timestamp: 1403096908466
)

d_no.cpu_infos.create!(
usage: 46,
client_timestamp: 1403096910041
)

d_no.cpu_infos.create!(
usage: 49,
client_timestamp: 1403096911544
)

d_no.cpu_infos.create!(
usage: 41,
client_timestamp: 1403096913004
)

d_no.cpu_infos.create!(
usage: 19,
client_timestamp: 1403096914303
)



d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2288017,
native_heap_size: 671875,
dalvik_heap_size: 1226292,
native_heap_alloc: 647000,
mem_alloc: 2288024,
client_timestamp: 1403096883775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2299105,
native_heap_size: 731641,
dalvik_heap_size: 1236692,
native_heap_alloc: 647000,
mem_alloc: 2299112,
client_timestamp: 1403096884775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2301177,
native_heap_size: 731641,
dalvik_heap_size: 1236896,
native_heap_alloc: 647000,
mem_alloc: 2301184,
client_timestamp: 1403096885775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2304737,
native_heap_size: 731641,
dalvik_heap_size: 1239104,
native_heap_alloc: 647000,
mem_alloc: 2304744,
client_timestamp: 1403096886775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2305857,
native_heap_size: 731641,
dalvik_heap_size: 1239452,
native_heap_alloc: 647000,
mem_alloc: 2305864,
client_timestamp: 1403096887775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2309613,
native_heap_size: 731641,
dalvik_heap_size: 1241780,
native_heap_alloc: 647000,
mem_alloc: 2309620,
client_timestamp: 1403096888775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2315413,
native_heap_size: 731641,
dalvik_heap_size: 1245616,
native_heap_alloc: 647000,
mem_alloc: 2315420,
client_timestamp: 1403096889775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2315933,
native_heap_size: 757422,
dalvik_heap_size: 1245308,
native_heap_alloc: 647000,
mem_alloc: 2315940,
client_timestamp: 1403096890775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2317504,
native_heap_size: 757422,
dalvik_heap_size: 1245276,
native_heap_alloc: 647000,
mem_alloc: 2317512,
client_timestamp: 1403096891775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2324120,
native_heap_size: 757422,
dalvik_heap_size: 1249516,
native_heap_alloc: 647000,
mem_alloc: 2324128,
client_timestamp: 1403096892775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2323008,
native_heap_size: 763281,
dalvik_heap_size: 1248212,
native_heap_alloc: 647000,
mem_alloc: 2323016,
client_timestamp: 1403096893775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2329244,
native_heap_size: 763281,
dalvik_heap_size: 1254228,
native_heap_alloc: 647000,
mem_alloc: 2329252,
client_timestamp: 1403096894775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2329452,
native_heap_size: 763281,
dalvik_heap_size: 1253056,
native_heap_alloc: 647000,
mem_alloc: 2329460,
client_timestamp: 1403096895775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2334112,
native_heap_size: 766406,
dalvik_heap_size: 1256252,
native_heap_alloc: 647000,
mem_alloc: 2334120,
client_timestamp: 1403096896775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2335316,
native_heap_size: 766406,
dalvik_heap_size: 1257712,
native_heap_alloc: 647000,
mem_alloc: 2335324,
client_timestamp: 1403096897775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2336404,
native_heap_size: 766406,
dalvik_heap_size: 1256428,
native_heap_alloc: 647000,
mem_alloc: 2336412,
client_timestamp: 1403096898775
)

d_no.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2337164,
native_heap_size: 766406,
dalvik_heap_size: 1257860,
native_heap_alloc: 647000,
mem_alloc: 2337172,
client_timestamp: 1403096899775
)














d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "622,1781,872,211",
view: 'gridView',
sleep: 1905,
action_type: 'drag',
client_timestamp: 1403096895437
)

Screen.create!(client_timestamp: 1403096895437, image: "/assets/1403096895437.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "658,1714,813,274",
view: 'gridView',
sleep: 1869,
action_type: 'drag',
client_timestamp: 1403096897305
)

Screen.create!(client_timestamp: 1403096897305, image: "/assets/1403096897305.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "791,331,613,1822",
view: 'gridView',
sleep: 1619,
action_type: 'drag',
client_timestamp: 1403096898924
)

Screen.create!(client_timestamp: 1403096898924, image: "/assets/1403096898924.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "723,214,646,1837",
view: 'gridView',
sleep: 1779,
action_type: 'drag',
client_timestamp: 1403096900703
)

Screen.create!(client_timestamp: 1403096900703, image: "/assets/1403096900703.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "695,174,727,1792",
view: 'gridView',
sleep: 1556,
action_type: 'drag',
client_timestamp: 1403096902259
)

Screen.create!(client_timestamp: 1403096902259, image: "/assets/1403096902259.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "648,208,653,1746",
view: 'gridView',
sleep: 1716,
action_type: 'drag',
client_timestamp: 1403096903975
)

Screen.create!(client_timestamp: 1403096903975, image: "/assets/1403096903975.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "676,203,484,1753",
view: 'gridView',
sleep: 1562,
action_type: 'drag',
client_timestamp: 1403096905537
)

Screen.create!(client_timestamp: 1403096905537, image: "/assets/1403096905537.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "658,185,672,1782",
view: 'gridView',
sleep: 1494,
action_type: 'drag',
client_timestamp: 1403096907031
)

Screen.create!(client_timestamp: 1403096907031, image: "/assets/1403096907031.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "741,274,713,1825",
view: 'gridView',
sleep: 1435,
action_type: 'drag',
client_timestamp: 1403096908466
)

Screen.create!(client_timestamp: 1403096908466, image: "/assets/1403096908466.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "701,1696,878,72",
view: 'gridView',
sleep: 1575,
action_type: 'drag',
client_timestamp: 1403096910041
)

Screen.create!(client_timestamp: 1403096910041, image: "/assets/1403096910041.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "638,1718,863,118",
view: 'gridView',
sleep: 1503,
action_type: 'drag',
client_timestamp: 1403096911544
)

Screen.create!(client_timestamp: 1403096911544, image: "/assets/1403096911544.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "645,1660,858,64",
view: 'gridView',
sleep: 1460,
action_type: 'drag',
client_timestamp: 1403096913004
)

Screen.create!(client_timestamp: 1403096913004, image: "/assets/1403096913004.jpg")

d_no.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "613,1690,851,155",
view: 'gridView',
sleep: 1299,
action_type: 'drag',
client_timestamp: 1403096914303
)

Screen.create!(client_timestamp: 1403096914303, image: "/assets/1403096914303.jpg")
