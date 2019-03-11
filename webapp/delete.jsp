<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript">


$(function() {
	
	$("#btnDelete").click(function() {
		var writer = encodeURIComponent($("#writer").val());
		$("#writer").val(writer);
			
	});
});
	
	</script>
</head>
	<body>
		<h2>게시글 삭제</h2>
		<form action="delete.do" name="form1" method="post">
		이름
		<input name="writer" id="writer" placeholder="이름을 입력하면 삭제가 됩니다.">
		<button type="submit" id="btnDelete">삭제</button>
		</form>	
	</body>
</html>