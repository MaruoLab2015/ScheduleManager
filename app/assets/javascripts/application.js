// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require_tree .
$(function(){
    
    $("#member li").draggable({
//	appendTo: "body",
	revert: "invalid",
	helper: "clone"
//	cancel: "a.ui-icon"
    });
    
    $(".blank ol").droppable({
	accept: ':not(ui-sortable-helper)',
	tolerance: 'pointer',
	activeClass: "ui-state-default",
	hoverClass: 'ui-state-hover',
	drop: function(event, ui){
	    $(this).find(".placeholder").remove();
	    $('<li class="schedule"></li>').text(ui.draggable.text() ).appendTo(this);
	    //削除処理
//	    $(".schedule").click$;
	    //フォームのデータを渡す
	    //日付
	    var now = new Date($(this).attr("id"));
	    var roomName = $(this).attr("class");
	    if( $(this).is('.1')){
		$("#exp_plan_roomName").val(1);
		}
	    $("#exp_plan_planDay").val(now);
	    //使用者名前
	    $("#exp_plan_userName").val(ui.draggable.text());
	    //submitを押す
	    $("#new_exp_plan").submit();
	    
	}
	
    });
    //削除処理(データベース用)
    $(".schedule").click(function(){
	//$(this).remove();
	alert("削除してもよろしいでしょうか??");
    });
  });
