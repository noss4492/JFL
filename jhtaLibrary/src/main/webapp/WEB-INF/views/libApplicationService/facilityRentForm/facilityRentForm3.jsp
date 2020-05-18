<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="resources/css/applicationService/facilityRentForm/facilityRentForm3.css"/>" />
    
    
    

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/header.css">
<script src="js/viewjs/header.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"
	integrity="sha256-4iQZ6BVL4qNKlQ27TExEhBN1HFPvAvAMbFavKKosSWQ="
	crossorigin="anonymous"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



	
	
<script type="text/javascript" src="js/lib/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/lib/daterangepicker.css" />	
	
     

<title>facilityRentForm3.jsp</title>
<style>
	#mainWrapper {
   width: 1200px;
   margin: auto;
   display: flex;
}

.all_contents {
   width: 880px;   
   padding: 20px 0;
   margin-left: 50px;
   word-break: keep-all;
} 
a{
height: 80px;
width: 120px;
}

.drp-calendar left single{
width: 880px;
}
.calendar-table{
width: 878px;
height: 400px;

}
#placeApplyInfo{
	display: inline-block;
	width: 880px;
}
#placeApplyInfo .daterangepicker{
display: block !important;
width: 880px;
}
#dates{
font-size: 20px;
width: 600px;
height: 50px;

}
.daterangepicker {
width: 880px;
height: 550px;
/* background-color: red; */
}
/* .calendar-time{ */
/* float: right; */
/* } */
.drp-calendar left single{
display: inline-block;
width: 880px !important;
}
.calendar-time{
width: 880px;
height: 50px;

}
.daterangepicker ltr single opensright show-calendar{
height: 550px;
background-color: red;
}

.drp-calendar{
padding: 0px !important;
}
.table-condensed{
font-size: 20px !important;
}
.calendar-table{
padding-right: 0px;
}
.minuteselect{
display: none;
}
.cancelBtn{
width: 80px;
height: 40px;
font-size: 20px !important;
}
.applyBtn{
width: 80px;
height: 40px;
font-size: 20px !important;
}
#list{
width: 880px;
height: 600px;
background-color: yellow;
}
#resInfo{
width: 880px;
height: 200px;
background: green;
}
#resInfo table{
border-collapse: collapse;

}
#resInfo tr,td{
border: 1px solid black;
}
#resInfo td{
width: 176px;
height: 30px;
}
#resInfoTitle{
padding-bottom: 20px;
}
</style>
<script>

$(function() {
	  $('input[id="dates"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    timePicker:true,
	    timePicker24Hour:true,
	    timePickerIncrement:60,
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
	  },function(start, end, label){
		  console.log(start.format('YYYY-MM-DD'));
	  });
	  $('#dates').on('apply.daterangepicker',function(ev,picker){
		  	var con = confirm(picker.startDate.format('YYYY/MM/DD HH:mm:ss')+"에 대실 신청을 하시겠습니까?");
		  	if(con==true){
		  	var startTime = $("#startTime").val(picker.startDate.format('YYYY/MM/DD HH:mm:ss'));
			var endTime = picker.startDate.add(1,'h').format('YYYY/MM/DD HH:mm:ss');
			$("#endTime").val(endTime);
			var rentDate = picker.startDate.format('YYYY/MM/DD');
			$("#rentDate").val(rentDate);
			$("#requestDate").val(moment().format('YYYY-MM-DD HH:mm:ss'));
			//confirm(picker.startDate.subtract(1,'h').format('YYYY/MM/DD HH:mm:ss')+"에 대실 신청을 하시겠습니까?");
			
			document.frm.action = "placeApply";
			document.frm.method = "get";
			document.frm.submit();
		  		
		  	}else{
		  		
		  	}
		})
		$('#dates').on('hide.daterangepicker', function(ev, picker) {
            $('#dates').click();
        });
        $('#dates').click();

		
	});
	
			
		
		
		
		

</script>
</head>
<body>
  <%@include file="../../header.jsp"%>
   <div id="mainWrapper">
      <%@include file="../../sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="../../contentTitle.jsp"%>
            <div id="applyFormWrapper">
                
                <div id="applyformCore">
                    <div id="tabNav">
                        <ul id="tabNavContents">
                            <li><a href="#"> <strong>대관안내</strong></a></li>
                            <li><a href="./facilityRentForm2"><strong>시설안내</strong></a></li>   
                            <li><a href="./facilityRentForm3"><strong>신청현황/신청하기</strong></a></li>
                        </ul>
                    </div>
					
				<form action="placeApply" name="frm">
					<div id="placeApplyInfo">
						
  						<input type="text" id="dates" readonly="readonly">
  						<input type="hidden" id="startTime" name="startTime"/>
 						<input type="hidden" id="endTime" name="endTime"/>
  						<input type="hidden" id="rentPlaceId" name="rentPlaceId" value="1"/>
  						<input type="hidden" id="placeId" name="placeId" value="1"/>
  						<input type="hidden" id="userName" name="userName"/>
  						<input type="hidden" id="rentDate" name="rentDate"/>
  						<input type="hidden" id="requestDate" name="requestDate"/>
  						<input type="hidden" id="status" name="status" value="1"/>
					</div>
				</form>	
               	<div id="list">
               	
				
               	</div>
               	<div id="resInfo">
               	<h2 id="resInfoTitle"></h2>
				<table>
					<tr>
					<th>10:00</th>
					<th>11:00</th>
					<th>12:00</th>
					<th>13:00</th>
					<th>14:00</th>
					</tr>
					<tr>
						<td class="l"><input  class="time" type="hidden" value="10:00:00"/><div id="10:00:00"></div></td>
						<td class="l" ><input  class="time" type="hidden" value="11:00:00"/><div id="11:00:00"></div></td>
						<td class="l" ><input  class="time" type="hidden" value="12:00:00"/><div id="12:00:00"></div></td>
						<td class="l" ><input  class="time" type="hidden" value="13:00:00"/><div id="13:00:00"></div></td>
						<td class="l" ><input  class="time" type="hidden" value="14:00:00"/><div id="14:00:00"></div></td>
					</tr>
					<tr>
					<th>15:00</th>
					<th>16:00</th>
					<th>17:00</th>
					<th>18:00</th>
					<th>19:00</th>
					</tr>
					<tr>
						<td class="l" id="15:00:00"><input  class="time" type="hidden" value="15:00:00"/></td>
						<td class="l" id="16:00:00"><input  class="time" type="hidden" value="16:00:00"/></td>
						<td class="l" id="17:00:00"><input  class="time" type="hidden" value="17:00:00"/></td>
						<td class="l" id="18:00:00"><input  class="time" type="hidden" value="18:00:00"/></td>
						<td class="l" id="19:00:00"><input  class="time" type="hidden" value="19:00:00"/></td>
					</tr>
				</table>
				
               	</div>
                </div><!-- applyformCore-->
            </div><!-- applyFormWrapper -->
        </div><!-- all_contents-->
    </div><!-- mainWrapper -->
   
         
     
   <%@include file="../../footer.jsp"%>
</body>
</html>