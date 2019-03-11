<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var id = $("#id").val();		
			document.location.href = "paySearch?id=" + id;
		});
	</script>
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<form action="paySearch">
		<input type="hidden" id="id" name="id" value="<%= id %>">
	</form>
</body>
</html>