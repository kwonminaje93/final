<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript">
		
		$(function() {
			
			$("#login").click(function() {
				var id = $("#id").val();
				var pw = $("#pw").val();
				
				$.ajax({
					url: "login",
					type: "POST",
					data: {
						id: id,
						pw: pw
					},
					success: function(result) {
						var id = result.trim();
						
						if(id == "") {
							alert("아이디 또는 비밀번호를 확인해 주세요");
						} else {
							location.href="sessionReg.jsp?id="+id;
						}
					}
				});
				
			});
			
		});
	</script>
</head>
<body>

	<%
		
	%>
	
	<jsp:include page="resources/includes/header.jsp" flush="false"/>

	<div class="container ie-h-align-center-fix">
			<div class="container tm-pt-5 tm-pb-4">
				<hr color="blue">
				<div class="tm-section tm-section-pad tm-bg-gray" id="tm-section-4">
                	<div class="container">
                    	<div class="center">
						<div style="width: 150; height: 500; background-color: skyblue;
						padding: 100px;">
						
						<h3>LOGIN</h3> <br>
						
						<p> I D:&nbsp;&nbsp; <input type="text" size="50" name="id" id="id"> </p><br>
						<p> P W: <input type="password" size="50" name="pw" id="pw"></p> <br>
							
						<button type="submit" class="btn btn-primary tm-btn-search" id="login">로그인</button>
						<p></p>
						<a href="member.jsp"><button type="submit" class="btn btn-primary tm-btn-search">회원가입</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>