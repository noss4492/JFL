<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<style>
#test {
	border-collapse: collapse;
}

#test tr, td {
	border: 1px solid black;
	height: 50px;
}
</style>
<script>
$(function(){
	
$('#demo').daterangepicker({
    "singleDatePicker": true,
    "linkedCalendars": false,
    "showCustomRangeLabel": false,
    "startDate": "05/07/2020",
    "endDate": "05/13/2020",
    "opens": "center"
}, function(start, end, label) {
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
$("td.available").on("click",function(){
	console.log("sldkfjldskfj");
})
})

$(function() {
	  $('input[id="dates"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
// 	    timePicker:true,
// 	    timePicker24Hour:true,
// 	    timePickerIncrement:60,
	    opens:"right",
	    
	    locale: {
	        "format": "YYYY/MM/DD HH:mm:ss",
	        "separator": " - ",
	        "applyLabel": "신청",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "daysOfWeek": [
	            "일","월","화","수","목","금","토"
	        ],
	        "monthNames": [
	            "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
	        ],
	        "firstDay": 1
	    }
	  },function(start,end,label){
		  console.log(start.format('YYYY-MM-DD'));
	  });
	  $('#dates').on('apply.daterangepicker',function(ev,picker){
		  	var startTime = $("#startTime").val(picker.startDate.format('YYYY/MM/DD HH:mm:ss'));
			var endTime = picker.startDate.add(1,'h').format('YYYY/MM/DD HH:mm:ss');
			$("#endTime").val(endTime);
			var rentDate = picker.startDate.format('YYYY-MM-DD');
			$("#rentDate").val(rentDate);
			$("#requestDate").val(moment().format('YYYY-MM-DD HH:mm:ss'));
			alert(picker.startDate.subtract(1,'h').format('YYYY/MM/DD HH:mm:ss')+"에 대실 신청을 하시겠습니까?");
		})
// 		$('#dates').on('hide.daterangepicker', function(ev, picker) {
//             $('#dates').click();
//         });
//         $('#dates').click();
        $('td.available').on("click",function(){
        	console.log("여기서는 되는거냐");
        })
})
</script>
<body>
	<div id="test">
		<input type="text" id="demo" />

	</div>
	<div>
		<input type="text" id="dates" />
	</div>

</body>
</html>