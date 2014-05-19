function progressUpdate (total_report_id) {
	$.getJSON('/api/v1/total_reports/'+ total_report_id + '/test_progress', function(data){
    $('#test-progress-bar').css("width", data + "%");
    if(data == 100){
    	location.reload();
    }else{
    	progressUpdateTime(total_report_id)
    }
  });
}

function progressUpdateTime(total_report_id){
  setTimeout(function(){
    progressUpdate(total_report_id)
  }, 5000);
}
