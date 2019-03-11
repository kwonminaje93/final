<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Level HTML Template</title>
<!--

Template 2095 Level

http://www.tooplate.com/view/2095-level

-->
    <!-- load stylesheets -->

    <link rel="stylesheet" href="resources/font-awesome-4.7.0/css/font-awesome.min.css">                <!-- Font Awesome -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">                                      <!-- Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css"/>
    <link rel="stylesheet" href="resources/css/tooplate-style.css">                                   <!-- Templatemo style -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
</head>
 <script src="resources/js/jquery-1.11.3.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
        <script src="resources/js/popper.min.js"></script>                    <!-- https://popper.js.org/ -->       
        <script src="resources/js/bootstrap.min.js"></script>                 <!-- https://getbootstrap.com/ -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>                <!-- https://github.com/qodesmith/datepicker -->
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
        <script src="resources/js/jquery.singlePageNav.min.js"></script> 
<script type="text/javascript">
// Date Picker
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
</script>
<body>

 			<div class="tm-section tm-bg-img" id="tm-section-1" style="resize:none;">
                <div class="tm-bg-white ie-container-width-fix-2" style="resize:none;">
                    <div class="container ie-h-align-center-fix" >
                        <div class="row">
                            <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                                <form action="hp2.jsp" method="get" class="tm-search-form tm-section-pad-2">
                                    <div class="form-row tm-search-form-row">
                                        <div class="form-group tm-form-element tm-form-element-100">
                                            <select id="room" name="room" style="width:198px; height:45px;">
                                            	<option value="motel">호텔</option>
                                            	<option value="pension">펜션</option>
                                            </select>
                                        </div>
                                        <div class="form-group tm-form-element tm-form-element-100">
                                            <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                            <select id="location" name="location" style="width:198px; height:45px;">
                                            	<option value="경기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경기</option>
                                            </select>
                                        </div>
                                        <div class="form-group tm-form-element tm-form-element-50">
                                            <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                                            <input name="inputCheckIn" type="text" class="form-control" id="inputCheckIn" placeholder="체크인">
                                        </div>
                                        <div class="form-group tm-form-element tm-form-element-50">
                                            <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                                            <input name="inputCheckOut" type="text" class="form-control" id="inputCheckOut" placeholder="체크아웃">
                                        </div>
                                    </div>
                                    
                                            <button type="submit" class="btn btn-primary tm-btn-search">숙소검색</button>
                                 
                                </form>
                            </div>                        
                        </div>      
                    </div>
                </div>                  
            </div>

</body>
</html>