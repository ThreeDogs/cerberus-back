function progressCircle(){
  var opts = {
    lines: 13, // The number of lines to draw
    length: 20, // The length of each line
    width: 10, // The line thickness
    radius: 30, // The radius of the inner circle
    corners: 1, // Corner roundness (0..1)
    rotate: 0, // The rotation offset
    direction: 1, // 1: clockwise, -1: counterclockwise
    color: '#000', // #rgb or #rrggbb or array of colors
    speed: 1, // Rounds per second
    trail: 60, // Afterglow percentage
    shadow: false, // Whether to render a shadow
    hwaccel: false, // Whether to use hardware acceleration
    className: 'spinner', // The CSS class to assign to the spinner
    zIndex: 2e9, // The z-index (defaults to 2000000000)
    top: '50%', // Top position relative to parent
    left: '50%' // Left position relative to parent
  };

  var target = document.getElementById('progress-circle');
  var spinner = new Spinner(opts).spin(target);
}

function requestDone(apk_id){
  $.getJSON('/api/v1/apks/'+apk_id+'/apk_conversion_status', function(data){
    if(data){
      location.reload();
    }else{
      requestDoneTime(apk_id)
    }
  });
}

function requestDoneTime(apk_id){
  setTimeout(function(){
    requestDone(apk_id)
  }, 5000);  
}

var fileUploadErrors = {
  maxFileSize: 'File is too big',
  minFileSize: 'File is too small',
  acceptFileTypes: 'Filetype not allowed',
  maxNumberOfFiles: 'Max number of files exceeded',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
};


$(document).ready(function(){
  $('#fileupload').fileupload({
      acceptFileTypes: /(\.|\/)(apk)$/i,
      maxNumberOfFiles: 1,
      singleFileUploads: true,
      autoUpload: false,
      add: function(e, data){
        console.log(data);
        $('h1#apk-upload-header1').text(data.files[0].name);
        $('#upload-button').removeClass("hidden");
        data.context = $('#upload-button');
        $('#upload-button').click(function(){
          data.submit();
        });
      },
      done: function(e, data){
        location.href="/projects/" + data.result[0] + "/apks/" + data.result[1];
      }
    });

  $('.fileinput-button').click(function(){
    document.getElementById('upload-field').click();
  });
});

// test scenario choice
$(function(){
  $('input:checkbox').attr("checked", true);
  $("#checkAll").change(function () {
    $(".test-scenario-item input:checkbox").prop('checked', $(this).prop("checked"));
  });
});