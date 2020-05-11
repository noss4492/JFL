<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<style>
#1{
	display: inline;
}
#2{
	display: inline;
}
/* .daterangepicker{ */
/* width: 500px; */
/* } */
</style>
<script>
function addTime(h) {
	var addedTime = moment(moment().add(h, 'h')).format(
			'YYYY-MM-DD HH:mm:ss');
	return addedTime;
}


	






$(function() {
	  $('input[id="dates"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    timePicker:true,
	    timePicker24Hour:true,
	    timePickerIncrement:60,
	    locale: {
	        "format": "YYYY/MM/DD HH:mm:ss",
	        "separator": " - ",
	        "applyLabel": "신청",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 1
	    }
	  }, function(start, end, label) {
 		  console.log("startTIme : "+start);
			
	  });
	  $('#dates').on('apply.daterangepicker',function(ev,picker){
		  	var startTime = $("#startTime").val(picker.startDate.format('YYYY/MM/DD HH:mm:ss'));
			var endTime = picker.startDate.add(1,'h').format('YYYY/MM/DD HH:mm:ss');
			$("#endTime").val(endTime);
			var rentDate = picker.startDate.format('YYYY-MM-DD');
			$("#rentDate").val(rentDate);
			$("#requestDate").val(moment().format('YYYY-MM-DD HH:mm:ss'));
			
			//console.log(endTime);
			document.frm.action = "placeApply";
			document.frm.method = "get";
			document.frm.submit();
		})
	});
	
	$(function(){
$('#demo').daterangepicker({
    "timePicker": true,
    "timePicker24Hour": true,
    "startDate": "05/05/2020",
    "endDate": "05/11/2020"
}, function(start, end, label) {
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
		
	})



</script>
</head>
 <body>
<div>
<form action="placeApply" name="frm">
<div id="1">
  <input type="text" id="dates">
  <input type="text" id="startTime" name="startTime"/>
  <input type="text" id="endTime" name="endTime"/>
  <input type="text" id="rentPlaceId" name="rentPlaceId" value="1"/>
  <input type="text" id="placeId" name="placeId" value="1"/>
  <input type="text" id="userName" name="userName"/>
  <input type="text" id="rentDate" name="rentDate"/>
  <input type="text" id="requestDate" name="requestDate"/>
  <input type="text" id="status" name="status" value="1"/>
  
  
</div>
</form>
<div id="2">
	<input type="text" id="demo"/>
</div>
</div>
 	
 </body>
</html>