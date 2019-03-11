<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$("#btnUpdate").click(function() {
			
			var title = $("#title").val();
			var content = $("#content").val();
			var writer = $("#writer").val();
			
			if(title == "") {
				alter("제목을 입력하세요");
				document.form3.title.focus();
				return;
			}
			
			if(content == "") {
				alter("내용을 입력하세요");
				document.form3.content.focus();
				return;
			}
			
			if(writer == "") {
				alter("이름을 입력하세요");
				document.form3.writer.focus();
				return;
			}
			
		});
	});
</script>
</head>
	<body>
		<h2>게시글 수정</h2>
		<form name="form3" method="post" action="update.do">
		<div>
		제목
		<input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
		</div>
		<div>
		내용
		<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
		이름
		<input name="writer" id="writer" placeholder="이름을 입력해주세요">
		</div>
		<div style="width:650px; text-align: center;">
		<button type="submit" id="btnUpdate">확인</button>
		<button type="reset">취소</button>
		</div>
		</form>	
	</body>
</html>