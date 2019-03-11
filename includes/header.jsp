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
<script type="text/javascript">
$(function() {
	var mypage = $("#mypage").val();
	var logout = $("#logout").val();
	var main = $("#main").val();
	
	
	$("#sid").text(mypage);
	$("#insert").text(logout);
	$("#bid").text(main);	
	
	
	if($("#sid").text() == "마이페이지") {
		$("#sid").attr("href", "mypage.jsp")
	}
	
	if($("#insert").text() == "로그아웃") {
		$("#insert").attr("href", "logout.jsp")
	}
	
	if($("#bid").text() == "게시판") {
		$("#bid").attr("href", "list.jsp")
	}
	
	
});





</script>          
</head>

<body>
 <%
    	String id = (String)session.getAttribute("id");
    	String mypage = null;
    	String logout = null;
    	String main = null;
    	
    	if(id != null) {
    		mypage = "마이페이지";
    		logout = "로그아웃";
    		main = "게시판";
    		
    	} else {
    		mypage = "로그인";
    		logout = "회원가입";
    		main = "게시판X";
    		
    	}
    	
    	
    %>
			<div class="tm-top-bar" id="tm-top-bar">
                <!-- Top Navbar -->
                <div class="container">
                    <div class="row">
                        
                        <nav class="navbar navbar-expand-lg narbar-light">
                            <a class="navbar-brand mr-auto" href="index.jsp">
                                <img src="resources/img/logo.png" alt="Site logo">
                                   THE 숙박
                            </a>
                            <button type="button" id="nav-toggle" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#mainNav"  aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div id="mainNav" class="collapse navbar-collapse tm-bg-white">
                                <ul class="navbar-nav ml-auto">
                                  <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">홈 <span class="sr-only">(current)</span></a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="index.jsp" id="bid">게시판X</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="login.jsp" id="sid">로그인</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="member.jsp" id="insert">회원가입</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="search.jsp">결제확인</a>
                                  </li>
                                </ul>
                            </div>                            
                        </nav>            
                    </div>
                </div>
            </div>
            <input type="hidden" id="mypage" value="<%= mypage %>">
			<input type="hidden" id="logout" value="<%= logout %>">
			<input type="hidden" id="main" value="<%= main %>">
			
</body>
</html>