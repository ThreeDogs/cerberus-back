@total_report = @bitmap_project.total_reports.create!(status: true, created_at: 1.days.ago, apk_id:@apk_cache.id)

@total_report.scenarioships.create!(test_scenario_id: @test.id)

@total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR", device_key: "bitmap_test_device")

d = @total_report.detail_reports.create!(app_version: "1.2", status: 0, running_time: 1830, test_scenario_id: @test.id, device_key: "bitmap_test_device")

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 140,
client_timestamp: 1403096883775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 64,
client_timestamp: 1403096884775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 46,
client_timestamp: 1403096885775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 26,
client_timestamp: 1403096886775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 40,
client_timestamp: 1403096887775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 23,
client_timestamp: 1403096888775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 216,
client_timestamp: 1403096889775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403096890775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 208,
client_timestamp: 1403096891775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 227,
client_timestamp: 1403096892775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 114,
client_timestamp: 1403096893775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 44,
client_timestamp: 1403096894775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 78,
client_timestamp: 1403096895775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 137,
client_timestamp: 1403096896775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 221,
client_timestamp: 1403096897775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 222,
client_timestamp: 1403096898775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 205,
client_timestamp: 1403096899775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 207,
client_timestamp: 1403096900775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 41,
client_timestamp: 1403096910775
)

d.battery_infos.create!(
wifi: 411,
threeg: 0,
lcd: 720,
gps: 0,
sound: 0,
cpu: 11,
client_timestamp: 1403096914303
)






d.cpu_infos.create!(
usage: 52,
client_timestamp: 1403096883775
)

d.cpu_infos.create!(
usage: 26,
client_timestamp: 1403096895437
)

d.cpu_infos.create!(
usage: 37,
client_timestamp: 1403096896437
)

d.cpu_infos.create!(
usage: 20,
client_timestamp: 1403096897305
)

d.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096898924
)

d.cpu_infos.create!(
usage: 19,
client_timestamp: 1403096900703
)

d.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096902259
)

d.cpu_infos.create!(
usage: 25,
client_timestamp: 1403096902759
)

d.cpu_infos.create!(
usage: 44,
client_timestamp: 1403096883275
)

d.cpu_infos.create!(
usage: 30,
client_timestamp: 1403096883775
)

d.cpu_infos.create!(
usage: 28,
client_timestamp: 1403096905537
)

d.cpu_infos.create!(
usage: 38,
client_timestamp: 1403096907031
)

d.cpu_infos.create!(
usage: 15,
client_timestamp: 1403096908466
)

d.cpu_infos.create!(
usage: 46,
client_timestamp: 1403096910041
)

d.cpu_infos.create!(
usage: 49,
client_timestamp: 1403096911544
)

d.cpu_infos.create!(
usage: 41,
client_timestamp: 1403096913004
)

d.cpu_infos.create!(
usage: 19,
client_timestamp: 1403096914303
)



d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2292461,
native_heap_size: 671875,
dalvik_heap_size: 1226292,
native_heap_alloc: 647000,
mem_alloc: 2288024,
client_timestamp: 1403096883775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2306161,
native_heap_size: 731641,
dalvik_heap_size: 1236692,
native_heap_alloc: 647000,
mem_alloc: 2299112,
client_timestamp: 1403096884775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2307841,
native_heap_size: 731641,
dalvik_heap_size: 1236896,
native_heap_alloc: 647000,
mem_alloc: 2301184,
client_timestamp: 1403096885775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2311105,
native_heap_size: 731641,
dalvik_heap_size: 1239104,
native_heap_alloc: 647000,
mem_alloc: 2304744,
client_timestamp: 1403096886775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2312229,
native_heap_size: 731641,
dalvik_heap_size: 1239452,
native_heap_alloc: 647000,
mem_alloc: 2305864,
client_timestamp: 1403096887775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2316553,
native_heap_size: 731641,
dalvik_heap_size: 1241780,
native_heap_alloc: 647000,
mem_alloc: 2309620,
client_timestamp: 1403096888775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2318341,
native_heap_size: 731641,
dalvik_heap_size: 1245616,
native_heap_alloc: 647000,
mem_alloc: 2315420,
client_timestamp: 1403096889775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2326029,
native_heap_size: 757422,
dalvik_heap_size: 1245308,
native_heap_alloc: 647000,
mem_alloc: 2315940,
client_timestamp: 1403096890775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328893,
native_heap_size: 757422,
dalvik_heap_size: 1245276,
native_heap_alloc: 647000,
mem_alloc: 2317512,
client_timestamp: 1403096891775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328164,
native_heap_size: 757422,
dalvik_heap_size: 1249516,
native_heap_alloc: 647000,
mem_alloc: 2324128,
client_timestamp: 1403096892775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328893,
native_heap_size: 763281,
dalvik_heap_size: 1248212,
native_heap_alloc: 647000,
mem_alloc: 2323016,
client_timestamp: 1403096893775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328164,
native_heap_size: 763281,
dalvik_heap_size: 1254228,
native_heap_alloc: 647000,
mem_alloc: 2329252,
client_timestamp: 1403096894775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328893,
native_heap_size: 763281,
dalvik_heap_size: 1253056,
native_heap_alloc: 647000,
mem_alloc: 2329460,
client_timestamp: 1403096895775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328164,
native_heap_size: 766406,
dalvik_heap_size: 1256252,
native_heap_alloc: 647000,
mem_alloc: 2334120,
client_timestamp: 1403096896775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328893,
native_heap_size: 766406,
dalvik_heap_size: 1257712,
native_heap_alloc: 647000,
mem_alloc: 2335324,
client_timestamp: 1403096897775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328164,
native_heap_size: 766406,
dalvik_heap_size: 1256428,
native_heap_alloc: 647000,
mem_alloc: 2336412,
client_timestamp: 1403096898775
)

d.memory_infos.create!(
mem_total: 2498820,
dalvik_heap_alloc: 2328893,
native_heap_size: 766406,
dalvik_heap_size: 1257860,
native_heap_alloc: 647000,
mem_alloc: 2337172,
client_timestamp: 1403096899775
)














d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "622,1781,872,211",
view: 'gridView',
sleep: 1905,
action_type: 'drag',
client_timestamp: 1403096895437
)

Screen.create!(client_timestamp: 1403096895437, image: "/assets/1403096895437.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "658,1714,813,274",
view: 'gridView',
sleep: 1869,
action_type: 'drag',
client_timestamp: 1403096897305
)

Screen.create!(client_timestamp: 1403096897305, image: "/assets/1403096897305.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "791,331,613,1822",
view: 'gridView',
sleep: 1619,
action_type: 'drag',
client_timestamp: 1403096898924
)

Screen.create!(client_timestamp: 1403096898924, image: "/assets/1403096898924.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "723,214,646,1837",
view: 'gridView',
sleep: 1779,
action_type: 'drag',
client_timestamp: 1403096900703
)

Screen.create!(client_timestamp: 1403096900703, image: "/assets/1403096900703.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "695,174,727,1792",
view: 'gridView',
sleep: 1556,
action_type: 'drag',
client_timestamp: 1403096902259
)

Screen.create!(client_timestamp: 1403096902259, image: "/assets/1403096902259.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "648,208,653,1746",
view: 'gridView',
sleep: 1716,
action_type: 'drag',
client_timestamp: 1403096903975
)

Screen.create!(client_timestamp: 1403096903975, image: "/assets/1403096903975.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "676,203,484,1753",
view: 'gridView',
sleep: 1562,
action_type: 'drag',
client_timestamp: 1403096905537
)

Screen.create!(client_timestamp: 1403096905537, image: "/assets/1403096905537.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "658,185,672,1782",
view: 'gridView',
sleep: 1494,
action_type: 'drag',
client_timestamp: 1403096907031
)

Screen.create!(client_timestamp: 1403096907031, image: "/assets/1403096907031.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "741,274,713,1825",
view: 'gridView',
sleep: 1435,
action_type: 'drag',
client_timestamp: 1403096908466
)

Screen.create!(client_timestamp: 1403096908466, image: "/assets/1403096908466.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param:  "686,1724,762,115",
view: 'gridView',
sleep: 0,
action_type: 'drag',
client_timestamp: 1403096883775
)

Screen.create!(client_timestamp: 1403096883775, image: "/assets/1403096883775.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "701,1696,878,72",
view: 'gridView',
sleep: 1575,
action_type: 'drag',
client_timestamp: 1403096910041
)

Screen.create!(client_timestamp: 1403096910041, image: "/assets/1403096910041.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "638,1718,863,118",
view: 'gridView',
sleep: 1503,
action_type: 'drag',
client_timestamp: 1403096911544
)

Screen.create!(client_timestamp: 1403096911544, image: "/assets/1403096911544.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "645,1660,858,64",
view: 'gridView',
sleep: 1460,
action_type: 'drag',
client_timestamp: 1403096913004
)

Screen.create!(client_timestamp: 1403096913004, image: "/assets/1403096913004.jpg")

d.motion_event_infos.create!(
activity_class: 'com.example.android.bitmapfun.ui.ImageGridActivity',
param: "613,1690,851,155",
view: 'gridView',
sleep: 1299,
action_type: 'drag',
client_timestamp: 1403096914303
)

Screen.create!(client_timestamp: 1403096914303, image: "/assets/1403096914303.jpg")
