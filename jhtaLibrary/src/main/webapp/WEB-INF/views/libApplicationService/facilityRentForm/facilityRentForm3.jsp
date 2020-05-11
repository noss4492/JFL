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



	
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />	
	
     

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
</style>
<script>
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
	            "일","월","화","수","목","금","토"
	        ],
	        "monthNames": [
	            "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
	        ],
	        "firstDay": 1
	    }
	  });
	  $('#dates').on('apply.daterangepicker',function(ev,picker){
		  	var startTime = $("#startTime").val(picker.startDate.format('YYYY/MM/DD HH:mm:ss'));
			var endTime = picker.startDate.add(1,'h').format('YYYY/MM/DD HH:mm:ss');
			$("#endTime").val(endTime);
			var rentDate = picker.startDate.format('YYYY-MM-DD');
			$("#rentDate").val(rentDate);
			$("#requestDate").val(moment().format('YYYY-MM-DD HH:mm:ss'));
			
			document.frm.action = "placeApply";
			document.frm.method = "get";
			document.frm.submit();
		})
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
						
						
						
				
                  
                  
                        
                        
                   
                
                
                
                
                
                    </div><!-- applyformCore-->
            </div><!-- applyFormWrapper -->
        </div><!-- all_contents-->
    </div><!-- mainWrapper -->
   
         
     
   <%@include file="../../footer.jsp"%>
</body>
</html>