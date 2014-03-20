# id = sequence
# time=java의 타임스탬프
# sleep=기다린 시간
# activityClass = 현재 띄어져 있는 Activity (Adapter안으로 들어가니 Adapter가 나왔는데 Activity를 어떻게서든 뽑을 예정)
# type=Click LongClick (클릭 기능) Drag, Selected (리스트 또는 스크롤 뷰에서 가능한 기능), setDate, setTime(DatePicker, TimePicker), OptionMenu(안드로이드 외부에 메뉴 버튼) 와 같은 데이터만 들어간다 나중에 추가될 수도 있음
# param=있을수도 있고 없을수도 있다 리스터에 View 이외에 필요한 정보들은 param에 String Type으로 담는다.
# view=R.id.ViewName
# reportKey=프로파일링 키

class CreateMotionEvents < ActiveRecord::Migration
  def change
    create_table :motion_events do |t|
      t.integer :seq_id
      t.timestamp :time_stamp
      t.integer :sleep
      t.string :activity_class
      t.string :action_type
      t.string :param
      t.string :view
      t.integer :test_scenario_id

      t.timestamps
    end
  end
end
