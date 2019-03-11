<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="com.itbank.mvcproject.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Offers</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/offers_responsive.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/offers_custom.js"></script>

<script src="resources/js/jquery.min.js"></script>

<!-- 구글맵연동script -->
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAWSeh_MuLbOJoeXPvvdhEsO71qQqiTKM8&callback=initMap" async defer></script>

<% 	
	
	String location = request.getParameter("location");	
	String inputCheckIn = request.getParameter("inputCheckIn"); 
	String inputCheckOut = request.getParameter("inputCheckOut"); 

%> 
<script type="text/javascript">

$(function() {
	//숙소검색
	
	$("#b1").click(function(){
	    var d = $("#search_1").serialize();
	    console.log(d);
	    
		$.ajax({
			url: "selectLo", 
			data: d,
			
			success: function(result) {
			 	$("#container2").html(result);
			 	
			}	
			});
		
	    
	    
	});
	 
	$("#b2").click(function(){
		$.ajax({
 			url: "selectAllHP",
			
			datatype: "text",
			success: function(result) {
				$("h1").html(result);
	
			}
 		});
		
		});
	

	});
	
	  function initMap() {
			initialize();
	  }
	  
      function initialize() { 
        var mapLocation = new google.maps.LatLng('36.501865', '129.032772'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('36.322473', '127.412501'); // 마커가 위치할 위도와 경도
        
        var initLatLng = {lat:36.3219522, lng:129.2329301};
        
        <%
        
        
        %>
        
        $.ajax({
        	
			datatype: "json",
        	url: "resources/json/seoul.json",
			
			success: function(result) {
			 		console.log(result);
			 	
			 	 $.each(result, function(index, hp){
			 		$("#id").val(hp.id);
		 			$("#name").val(hp.nm);
		 			$("#location").val(hp.addr_old);
		 		
		 			$("#lat").val(hp.xcode);
		 			$("#lng").val(hp.ycode); 
		 		
				 }); 
			 		}
			
			});
        
        var locations = [
            [new google.maps.LatLng(37.486233,127.174387),],
         	
            
          ];	
        
        //맵옵션
        var mapOptions = {
        	zoom: 14,
        	center: initLatLng,
        	mapTypeId: google.maps.MapTypeId.ROADMAP
        
        };
        
        //맵생성
        var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
        
        
        var infowindow = new google.maps.InfoWindow();
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
        var marker, i;
        
        //마커중심부
        
        function popInfoWindow(latlng){
			
        	var geocoder = new google.maps.Geocoder();
        		map.setCenter(latlng);
        		addMarker(latlng);	//마커출력
        		geocoder.geocode({'latLng': latlng}, function(results, status) {
				
        	if (status == google.maps.GeocoderStatus.OK) {
        		
        		if (results[1]) {
        			var contentString =
        				'<div id="content">'+
        					'<br><div id=="adress">'+
        					'<b>html 코드 삽입 가능</b>'+
        					'<br></div>'+
        					'<p>' +
               				'<b>주소 :</b> ' +results[1].formatted_address+
        					'</p>'+
        				'</div>';
        			infowindow.setContent(contentString);
        			infowindow.open(map, marker);
        		} else {
        			alert("No results found");
        		}
        	}else{
        		alert("Geocoder failed due to: " + status);
        	}
        	});
        }
        
        function ShowLocation(lat, lng, title) { 
        }
        	
        //마커찍기
          for (i = 0; i < locations.length; i++) {  
          marker = new google.maps.Marker({
            
        	position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map
          });
          
          google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
              map.setZoom(16);
              map.setCenter(marker.getPosition());

              infowindow.setContent(locations[i][0]);
              infowindow.open(map, marker);
              popInfoWindow(latlng);
              
              
              
            }
          })(marker, i));
        }  
    	/* // Geocoding *****************************************************
        var address = '서울특별시 강서구 공항동 1375번지'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( {'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                title: '호텔', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content = "<br/><br/>Tel: 042-580-4114"; // 말풍선 안에 들어갈 내용
             
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // ***************************************************** */
        
      }

</script>

<style type="text/css">
div.container {
    position: relative;
 	left: -20px;
    <!-- border: 3px solid #73AD21; -->
    
} 
div.container2 {
    position: relative;
 	left: 400px;
 	top: -140px;
    <!-- border: 3px solid #73AD21; -->
    
} 
div.container3 {
    position: relative;
 	left: 1100px;
 	top: -100px;
    <!-- border: 3px solid #73AD21; -->
    width: 1800px;
} 
div.container4 {
    position: relative;
 	left: 1100px;
 	top: -200px;
    <!-- border: 3px solid #73AD21; -->
    width: 1800px;
} 

</style>
</head>

<body>
	<!-- Header -->
	
	<!-- Home -->

	<jsp:include page="resources/includes/header.jsp" flush="false"/>
	<div class="home">
	
		<a href="index.jsp"><img src="resources/images/about_background.jpg" ></a>
		
	</div>

	<!-- Offers -->

	  <div class="offers">

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
                        <form id="search_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_item">
                           <div>지역</div>
                                            <select id="location" name="location" style="width:198px; height:45px;">
                                            	
                                               <option value="">전체검색</option>
                                               
                                               <option value="경기">경기</option>
                                              
                                              
                                               
                                            </select>
                                        </div>
                           <div class="search_item"></div>
                           
                           <div>지역검색</div>
                           <div class="form-group tm-form-element tm-form-element-50">
                                <input name="location2" type="text" class="form-control" id="location2" placeholder="상세지역검색">
                          </div>
                           <%if(inputCheckIn ==null) {
                        	   
                           %>
                           <div>체크인</div>
                           <div class="form-group tm-form-element tm-form-element-50">
                                <input name="inputCheckIn" type="text" class="form-control" id="inputCheckIn" placeholder="체크인">
                          </div>
                           <%}else { %>
                           <div>체크인</div>
                           <div class="form-group tm-form-element tm-form-element-50">
                                <input name="inputCheckIn" type="text" class="form-control" id="inputCheckIn" placeholder="체크인" value="<%=inputCheckIn %>">
                          </div>
                           <%}%>
                           <%if(inputCheckOut ==null) { %>
                          
                              <div>체크아웃</div>
                          <div class="form-group tm-form-element tm-form-element-50">
                                <input name="inputCheckOut" type="text" class="form-control" id="inputCheckOut" placeholder="체크아웃">
                          </div>
                           <%}else { %>
                          
                              <div>체크아웃</div>
                          <div class="form-group tm-form-element tm-form-element-50">
                                <input name="inputCheckOut" type="text" class="form-control" id="inputCheckOut" placeholder="체크아웃" value="<%=inputCheckOut %>">
                          </div>
                           <%}%>
                          
                          
                          
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
                           <button class="button search_button" id="b1"><img src="resources/hp/click3.png"></button>
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
                                <input name="check-in" type="text" class="form-control" id="inputCheckIn2" placeholder="체크인">
                          </div>
                          </div>
                           <div class="search_item">
                              <div>체크아웃</div>
                          <div class="form-group tm-form-element tm-form-element-50">
                                <input name="check-out" type="text" class="form-control" id="inputCheckOut2" placeholder="체크아웃">
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
                           <button class="button search_button" id="b2">검색하기<span></span><span></span><span></span></button>
                     </div>
                  </div>
               </div>
            </div>   
         </div>   
      	</div>
      	</div>
		<!-- Offers -->
		<h1></h1>
		<div class="container2" id="container2" >
				<div class="offers_sorting_container">
				<p class="policy_name">
			<span class="policy_name_icon"> <svg
					class="bk-icon -experiments-calendar_checkin hp-policies-calendar-icon"
					height="20" width="20" viewBox="0 0 128 128"> <path
					d="M112 16H96V8h-8v8H40V8h-8v8H16c-4.4 0-8 3.9-8 8.7v86.6c0 4.8 3.6 8.7 8 8.7h96c4.4 0 8-3.9 8-8.7V24.7c0-4.8-3.6-8.7-8-8.7zm0 95.3a1.1 1.1 0 0 1-.2.7H16.2a1.1 1.1 0 0 1-.2-.7V40h96zM32 84h12v12H32zm38-16H58V56h12zm0 28H58V84h12zm26 0H84V84h12zm0-28H84V56h12zM48 52H28v20h20zm-6 14h-8v-8h8z" />
				</svg>
			</span> <span> 체크인 </span>
		</p>
		<p>
			<span data-component="prc/timebar" class="u-display-block"
				data-from="14:00" data-from-label="14:00" data-until="21:00"
				data-until-label="21:00" data-caption="14:00~21:00">
				14:00~21:00 </span>
		</p>
		
	 	
	
		<p class="policy_name">
			<span class="policy_name_icon"> <svg
					class="bk-icon -experiments-calendar_checkout hp-policies-calendar-icon"
					height="20" width="20" viewBox="0 0 128 128"> <path
					d="M112 16H96V8h-8v8H40V8h-8v8H16c-4.4 0-8 3.9-8 8.7v86.6c0 4.8 3.6 8.7 8 8.7h96c4.4 0 8-3.9 8-8.7V24.7c0-4.8-3.6-8.7-8-8.7zm0 95.3a1.1 1.1 0 0 1-.2.7H16.2a1.1 1.1 0 0 1-.2-.7V40h96zM44 68H32V56h12zm0 28H32V84h12zm26-28H58V56h12zm0 28H58V84h12zm26-28H84V56h12zm4 12H80v20h20zm-6 14h-8v-8h8z" />
				</svg>
			</span> <span> 체크아웃 </span>
		</p>
		<p>
		
			<span data-component="prc/timebar" class="u-display-block"
				data-until="13:00" data-until-label="13:00" data-from="00:00"
				data-from-label="00:00" data-caption="00:00~13:00">
				00:00~13:00 </span>
		</p>
						<ul class="offers_sorting">
							<li>
								<span class="sorting_text">가격대</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }' data-parent=".price_sorting"><span>5~10</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "price" }' data-parent=".price_sorting"><span>10~20</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "price" }' data-parent=".price_sorting"><span>20~30</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "price" }' data-parent=".price_sorting"><span>40~50</span></li>
								</ul>
							</li>
							
							<li>
								<span class="sorting_text">지역(구)</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>금천구</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>강서구</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>영등포구</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>마포구</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>역삼</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>관악구</span></li>
								</ul>
							</li>
							
							<li>
								<span class="sorting_text">별점</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="filter_btn" data-filter="*"><span></span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "stars" }'><span>0점</span></li>
									<li class="filter_btn" data-filter=".rating_3"><span>1점이상</span></li>
									<li class="filter_btn" data-filter=".rating_3"><span>2점이상</span></li>
									<li class="filter_btn" data-filter=".rating_3"><span>3점이상</span></li>
									<li class="filter_btn" data-filter=".rating_4"><span>4점이상</span></li>
									<li class="filter_btn" data-filter=".rating_5"><span>5점이상</span></li>
								</ul>
								
					
								
							</li>
							
							
		
							
						</ul>
						<div class="offers_item rating_4">
							
								<div class="col-lg-8">
										<div class="offers_icons">
											<ul class="offers_icons_list" >
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
								
										</div>
									<div class="offers_content">
										<div class="offers_price" align="right">$70<span></span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											<i></i>
											<i></i>
											<i></i>
											<i></i>
											<i></i>
										</div>
										<p class="offers_text">1</p>
										<br>
										지역:
		
									</div>
								</div>
													
								<div class="d"></div>
								
										<!-- Image by https://unsplash.com/@kensuarez -->
								
										<a href="index.jsp"><img id = "img" src="resources/hp/1.jpg" width="400" height="200" img style="
border: 3px solid gold;
border-radius: 7px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
"></a>
									
								</div>
						
					</div>
	
			
				
				<%
					/* if(location != null) {
					for (int i = 0; i < hpList.size(); i++) {
						dto = (HPDTO) hpList.get(i); */
				%>
>

				
				<%/* } } */%>
				</div>
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		<div class="container3">	
			<div id="map" style="width: 800PX; height: 1000px"></div>
		
		
		</div>
		<div class="container4">	
			
		
		
		</div>
		
</body>

</html>