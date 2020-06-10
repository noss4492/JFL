
$(function() {
	var jbOffset = $("#navBarWrapper").offset();
	var jbOffset2 = $("#navBarMain").offset();
	//console.log(jbOffset);
	$(window).scroll(function() {
		
		if ($(document).scrollTop() > jbOffset.top) {
			$("#navBarWrapper").addClass("jbFixed");
			$("#navBarMain").addClass("jbOffset2");

			// $("#contents").addClass("bodyDown");
		} else {
			$("#navBarWrapper").removeClass("jbFixed");
			$("#navBarMain").addClass("jbOffset2");
		}
	});
});

$(document).ready(function() {
	var target = document.querySelector("#hidden_title");
	var li = document.querySelectorAll('.lnb>li');
	var span = document.querySelectorAll('.lnb span');
	var div = document.querySelectorAll('.lnb span>div');
	var a = document.querySelectorAll('.lnb a');
	
	
	for (var i = 0; i < li.length; i++) {
		var temp = a[i].innerText;
		var temp2 = target.value;
		if(temp==temp2){
			if(document.querySelector("#hidden_menu")){
				//console.log("메뉴있어")
				li[i].classList.remove("Nav_li_off");
				li[i].classList.add("Nav_li_on_haveMenu");
			}else{
				//console.log("메뉴없어")
				li[i].classList.remove("Nav_li_off");
				li[i].classList.add("Nav_li_on");
			}
			
			span[i].classList.remove("glyph-p");
			span[i].classList.add("glyph-m");
			
			div[i].classList.remove("glyphicon-plus");
			div[i].classList.add("glyphicon-minus");
			
			a[i].classList.remove("Nav_non");
			a[i].classList.add("Nav_select");
		}
	}
	if(document.querySelector("#hidden_menu")){
		var temp = document.querySelectorAll(".submenu>li>a");
		var temp2 = document.querySelector("#hidden_menu").value;
			for(var i = 0; i < temp.length; i++){
				//console.log(temp[i].innerText);
				//console.log(temp2);
				if(temp[i].innerText==temp2){
					console.log(temp[i].innerText);					
					temp[i].classList.add("submenuSelect");
				}
			}
		};
});
