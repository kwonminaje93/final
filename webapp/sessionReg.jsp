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
		location.href="index.jsp";
	});
</script>
</head>
<body>
	<%
		String id = request.getParameter("id");
		session.setAttribute("id", id);
	%>
</body>
</html>