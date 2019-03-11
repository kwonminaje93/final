<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/offers_responsive.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>

<script>
<!-- 날짜 값 처리부분 -->
<%
		String check_in = request.getParameter("inputCheckIn");
		String check_out = request.getParameter("inputCheckOut");
		String name = request.getParameter("name"); //호텔이름
		String location = request.getParameter("location");//주소
		String price = request.getParameter("price"); //방가격
		int id = Integer.parseInt(request.getParameter("id"));
		
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		
		if(id > 21 && id < 40){
			id = id-20;
		}else if(id > 41 && id < 60){
			id = id-40;
		}else if(id > 61 && id < 80){
			id = id-60;
		}else if(id > 81 && id < 100){
			id = id-80;
		}
		
		if(check_in == null){
			check_in = "날짜를 선택해주세요";
		}
		
		if(check_in.equals("")){
			check_in = "날짜를 선택해주세요";
		}
		
		if(check_out == null) {
			check_out = "날짜를 선택해주세요";
		}
		
		if(check_out.equals("")){
			check_out = "날짜를 선택해주세요";
		}
		
%>

$(function(){
	
	var comp;
	var rName;
	$("#reser").click(function(){
		
	var hName = "<%=name%>";
	var name = "Standard";
	var ajaxName = encodeURIComponent(hName); //문자 변환

		$.ajax({
			url: "test",
			type: "POST",
			charset: "utf-8",
			data: {
				hName : ajaxName,
				name : name
			},
			dataType: "text",
			success : function(result) {
				comp = result.trim(); //complete
				rName = comp.split("\n"); //방이름
				console.log(rName[0]);
				console.log(rName[1]);
				
				if(rName[0]==0){
					alert("방예약할수있습니다.");
				}else if(rName[0] == 1){
					alert("방예약할 수 없습니다");
					history.back();
				}else if(check_in == "" || check_out == ""){
					alert("날짜를 선택해주세요");
				}
			}
		}); //   end ajax
	});
});

	
	
$(function(){
	
	$("#reser2").click(function(){
		
	var hName = "<%= name%>";
	var name = "Premium";
	var ajaxName = encodeURIComponent(hName);

		$.ajax({
			url: "test",
			type: "POST",
			charset: "utf-8",
			data: {
				hName : ajaxName,
				name : name
			},
			dataType: "text",
			success : function(result) {
				var comp = result.trim(); //complete
				var rName = comp.split("\n"); //방이름
				console.log(rName[0]);
				console.log(rName[1]);
				
				if(rName[0]==0){
					alert("방예약할수있습니다.");
				}else{
					alert("방예약할 수 없습니다");
					history.back();
				}
			}
		}); //   end ajax
	});
	});



//구글맵
function initialize(){
  
  var LatLng = new google.maps.LatLng(<%=lat %>, <%=lng %>); //위치
  var mapProp = {
    center: LatLng,
    zoom:15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  
  var marker = new google.maps.Marker({
	position: LatLng,
	map: map,
	
  });
  
}
 
google.maps.event.addDomListener(window, 'load', initialize);
//호텔 체크인
$(function(){
	$('#inputCheckIn').datepicker({
		dateFormat:"yy-mm-dd",
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate:0
	});
	 $("#inputCheckIn").datepicker(); 
});
//호텔 체크아웃
$(function(){
	$('#inputCheckOut').datepicker({
		dateFormat:"yy-mm-dd",
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate:0
	});
	 $("#inputCheckOut").datepicker(); 
});
//팬션 체크인
$(function(){
	$('#inputCheckIn2').datepicker({
		dateFormat:"yy년mm월dd일",
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate:0
	});
	 $("#inputCheckIn").datepicker(); 
});
//팬션 체크아웃
$(function(){
	$('#inputCheckOut2').datepicker({
		dateFormat:"yy년mm월dd일",
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate:0
	});
	 $("#inputCheckOut").datepicker(); 
});

//standard예약
$(function() {
	$("#reser").click(function() {
		var hName =$("#hName").text();
		var name = $("#name").text();
		var location = $("#addr").text();
		var price = $("#price").text().split("원");
		var inDay = $("#inputCheckIn").val();
		var outDay = $("#inputCheckOut").val();
		var img = $("#stImg").attr("src");
		document.location.href="reservation.jsp?hName=" + hName + "&name=" + name + "&price=" + price[0] + "&inDay=" + inDay + "&outDay=" + outDay + "&img=" + img + "&location=" + location;
	});
});

//primere예약
$(function() {
	$("#reser2").click(function() {
		var hName =$("#hName").text();
		var name = $("#name1").text();
		var location = $("#addr").text();
		var price = $("#price1").text().split("원");
		var inDay = $("#inputCheckIn").val();
		var outDay = $("#inputCheckOut").val();
		var img = $("#prImg").attr("src");
		
		document.location.href="reservation.jsp?hName=" + hName + "&name=" + name + "&price=" + price[0] + "&inDay=" + inDay + "&outDay=" + outDay + "&img=" + img + "&location=" + location;
	});
});
	
</script>
</head>

<body>
<div class="super_container">

   
   <!-- Header -->
   
   <jsp:include page="resources/includes/header.jsp" flush="false"/>
   
 
   
   <div class="menu trans_500">
      <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
         <div class="menu_close_container"><div class="menu_close"></div></div>
         <div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
         <ul>
            <li class="menu_item"><a href="index.html">home</a></li>
            <li class="menu_item"><a href="about.html">about us</a></li>
            <li class="menu_item"><a href="#">offers</a></li>
            <li class="menu_item"><a href="blog.html">news</a></li>
            <li class="menu_item"><a href="contact.html">contact</a></li>
         </ul>
      </div>
   </div>

   <!-- Home -->

   <div class="home">
      <div class="home_background parallax-window" data-parallax="scroll"><img class="home_background parallax-window" style src="resources/roomImg/3.jpg"></div>
      
      <div class="tm-section tm-bg-img" id="tm-section-1" style="resize:none;"></div>
      <div class="home_content">
         <div class="home_title"></div>
      </div>
   </div>

   <!-- Offers -->

   <div class="offers">
	<!--=============================================  -->
      <!-- Search -->
      <div class="search">
         <div class="search_inner">

            <!-- Search Contents -->
            
            <div class="container fill_height no-padding">
               <div class="row fill_height no-margin">
                  <div class="col fill_height no-padding">

                     <!-- Search Tabs -->

                     <div class="search_tabs_container">
                        <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/suitcase.png" alt=""><span>호텔</span></div>
                           <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/bus.png" alt="">팬션</div>
                        </div>      
                     </div>
                     

                     <!-- Search Panel -->
							 

                     <div class="search_panel active">
                        <form action="index.jsp" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_item">
                           <div>지역</div>
                                            <select id="location" name="location" style="width:198px; height:45px;">
                                            	<option value="gyeonggi">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경기</option>
                                            </select>
                                        </div>
                           <div class="search_item">
                           <div>체크인</div>
                           <div class="form-group tm-form-element tm-form-element-50">
                           <input name="check-in" type="text" class="form-control" id="inputCheckIn" value="<%=check_in%>">
                          </div>
                          </div>
                          <div class="search_item">
                          <div>체크아웃</div>
                          <div class="form-group tm-form-element tm-form-element-50">
                          		<input name="check-out" type="text" class="form-control" id="inputCheckOut" value="<%=check_out%>">
                          </div>
                          </div>
                           <div class="search_item">
                              <div>성인</div>
                              <select name="adults" id="adults_1" class="dropdown_item_select search_input">
                                 <option>01</option>
                                 <option>02</option>
                                 <option>03</option>
                              </select>
                           </div>
                           <div class="search_item">
                              <div>어린이</div>
                              <select name="children" id="children_1" class="dropdown_item_select search_input">
                                 <option>0</option>
                                 <option>01</option>
                                 <option>02</option>
                                 <option>03</option>
                              </select>
                           </div>
                        </form>
                     </div>
                     <!-- Search Panel -->

                     <div class="search_panel">
                        <form action="#" id="search_form_2" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_item">
                           <div>지역</div>
                                            <select id="location" name="location" style="width:198px; height:45px;">
                                            	<option value="gyeonggi">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경기</option>
                                            </select>
                                        </div>
                            <div class="search_item">
                           <div>체크인</div>
                           <div class="form-group tm-form-element tm-form-element-50">
                          		<input name="check-in" type="text" class="form-control" id="inputCheckIn2" value="<%=check_in%>">
                          </div>
                          </div>
                           <div class="search_item">
                              <div>체크아웃</div>
                          <div class="form-group tm-form-element tm-form-element-50">
                          		<input name="check-out" type="text" class="form-control" id="inputCheckOut2" value="<%=check_out%>">
                          </div>
                          </div>
                           <div class="search_item">
                              <div>성인</div>
                              <select name="adults" id="adults_2" class="dropdown_item_select search_input">
                                 <option>01</option>
                                 <option>02</option>
                                 <option>03</option>
                              </select>
                           </div>
                           <div class="search_item">
                              <div>어린이</div>
                              <select name="children" id="children_2" class="dropdown_item_select search_input">
                                 <option>0</option>
                                 <option>01</option>
                                 <option>02</option>
                                 <option>03</option>
                              </select>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>   
         </div>   
      </div>

      <!-- Offers -->
      <div class="container">
         <div class="row">
            <div class="col-lg-1 temp_col"></div>
            <div class="col-lg-12">
               <!-- 꾸미기 전용 -->
 				<div class="offers_price" id="hName"><h5><%= name %></h5></div><br><br><!--숙박 업체 이름 들어갑니다  -->
 				<div class="offers_price" id="addr"><span><h5><%= location %></h5></span></div><br><!--주소 들어갑니다 -->
 				<img src="resources/images/yanolja.png"><br>
 			<!--구글맵 들어갑니다  -->	
		  <div class="offers_price"  style="position:relative;left:800px">위치</div><br><br>
          <div id="googleMap" style="width:600px;height:500px;position:relative; left:800px; float:left;"></div>
          
               <div class="offers_grid">

                  <!-- Offers Item -->

                  <div class="offers_item rating_4">
                     <div class="row">
                        <div class="col-lg-1 temp_col"></div>
                        <div class="col-lg-3 col-1680-4">
                           <div class="offers_image_container">
                              <!-- Image by https://unsplash.com/@rktkn -->
                              <div class="offers_image_background" style="float:left;"><img class="offers_image_background" style src="resources/roomImg/<%=id%>.jpg" id=stImg></div>
                              
                           </div>
                        </div>
                        <div class="col-lg-8">
                           <div class="offers_content">
                              <div class="offers_price" style="float:left;">
                              <h5 id="name">Standard</h5>
                              <span id="price">700원</span></div><br>
                              <p class="offers_text">기준 2명(최대 2명)</p>
                              <div class="offers_icons">
                                 <ul class="offers_icons_list">
                                    <li class="offers_icons_item"><img src="images/post.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
                                 </ul>
                              </div>
                              <div class="button book_button" id="reser"><a href="#">예약하기</a></div>
                              <div class="offer_reviews">
                               
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
					
				
                  <!-- Offers Item -->

                  <div class="offers_item rating_3">
                     <div class="row">
                        <div class="col-lg-1 temp_col"></div>
                        <div class="col-lg-3 col-1680-4">
                           <div class="offers_image_container">
                              <!-- Image by https://unsplash.com/@itsnwa -->
                               <div class="offers_image_background" style="float:left;"><img class="offers_image_background" style src="resources/roomImg/<%=id%>-1.jpg" id=prImg></div>
                           </div>
                        </div>
                        <div class="col-lg-8">
                           <div class="offers_content">
                              <div class="offers_price">
                              <h5 id="name1">Premium</h5>
                              <span id="price1">1000원</span></div>
                              <p class="offers_text">기준3명(최대4명)</p>
                              <div class="offers_icons">
                                 <ul class="offers_icons_list">
                                    <li class="offers_icons_item"><img src="images/post.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
                                    <li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
                                 </ul>
                              </div>
                              <div class="button book_button" id="reser2"><a href="#">예약하기</a></div>
                              <div class="offer_reviews">
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>   
          </div>

   <!-- Footer -->

   <footer class="footer">
      <div class="container">
         <div class="row">

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column">
               <div class="footer_col">
                  <div class="footer_content footer_about">
                     <div class="logo_container footer_logo">
                        <div class="logo"><a href="#"><img src="images/logo.png" alt="">The 숙박</a></div>
                     </div>
                     <p class="footer_about_text">편안한 잠자리를 원하십니까? 바로여기 <%=name %>호텔을 이용해보세요. 편안한 밤, 행복한 밤을 느낄수 있으십니다.</p>
                     <ul class="footer_social_list">
                        <li class="footer_social_item"><a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest"></i></a></li>
                        <li class="footer_social_item"><a href="http://www.facebook.com"><i class="fa fa-facebook-f"></i></a></li>
                        <li class="footer_social_item"><a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                        <li class="footer_social_item"><a href="https://dribbble.com/"><i class="fa fa-dribbble"></i></a></li>
                        <li class="footer_social_item"><a href="https://www.behance.net/"><i class="fa fa-behance"></i></a></li>
                     </ul>
                  </div>
               </div>
            </div>

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column">
               <div class="footer_col">
                  <div class="footer_title">블로그포스트</div>
                  <div class="footer_content footer_blog">
                     
                     <!-- Footer blog item -->
                     <div class="footer_blog_item clearfix">
                        <div class="footer_blog_image"><img src="images/footer_blog_1.jpg"></div>
                        <div class="footer_blog_content">
                           <div class="footer_blog_title"><a href="blog.html">최고의 잠자리</a></div>
                           <div class="footer_blog_date"><%=check_in%></div>
                        </div>
                     </div>
                     
                     <!-- Footer blog item -->
                     <div class="footer_blog_item clearfix">
                        <div class="footer_blog_image"><img src="images/footer_blog_2.jpg"></div>
                        <div class="footer_blog_content">
                           <div class="footer_blog_title"><a href="blog.html">신선한 경험</a></div>
                           <div class="footer_blog_date"><%=check_in%></div>
                        </div>
                     </div>

                     <!-- Footer blog item -->
                     <div class="footer_blog_item clearfix">
                        <div class="footer_blog_image"><img src="images/footer_blog_3.jpg"></div>
                        <div class="footer_blog_content">
                           <div class="footer_blog_title"><a href="blog.html"><%=name%>호텔과 함께</a></div>
                           <div class="footer_blog_date"><%=check_in%></div>
                        </div>
                     </div>

                  </div>
               </div>
            </div>

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column">
               <div class="footer_col">
                  <div class="footer_title">정보</div>
                  <div class="footer_content footer_contact">
                     <ul class="contact_info_list">
                        <li class="contact_info_item d-flex flex-row">
                           <div><div class="contact_info_icon"><img src="images/placeholder.svg" alt=""></div></div>
                           <div class="contact_info_text"><%=location%></div>
                        </li>
                        <li class="contact_info_item d-flex flex-row">
                           <div><div class="contact_info_icon"><img src="images/phone-call.svg" alt=""></div></div>
                           <div class="contact_info_text">2556-808-8613</div>
                        </li>
                        <li class="contact_info_item d-flex flex-row">
                           <div><div class="contact_info_icon"><img src="images/message.svg" alt=""></div></div>
                           <div class="contact_info_text"><a href="mailto:contactme@gmail.com?Subject=Hello" target="_top">contactme@gmail.com</a></div>
                        </li>
                        <li class="contact_info_item d-flex flex-row">
                           <div><div class="contact_info_icon"><img src="images/planet-earth.svg" alt=""></div></div>
                           <div class="contact_info_text"><a href="https://colorlib.com">www.colorlib.com</a></div>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
		</div>
         </div>
      </div>
   </footer>

   <!-- Copyright -->

   <div class="copyright">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 order-lg-1 order-2  ">
               <div class="copyright_content d-flex flex-row align-items-center">
            </div>
         </div>
      </div>
   </div>

</div>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBv39EbVZaUPQzI2hh4yNGidHRVhP66QAw"></script>
<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/offers_custom.js"></script>

</body>

</html>