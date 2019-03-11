<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="memberUpdate">
		<form method="post" action="memberUpdate.do">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead>
					<tr>
						<th colspan="3" ><h4 style="text-align: center">회원 정보 수정</h4>
					</tr>
				</thead>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5>
						<td colspan="2">
						<input class="form-control" type="hidden" id="id" name="id" maxlength="20" value="<%session.getAttribute("id");%>">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2">
						<input class="form-control" type="password" id="pw" name="pw" maxlength="20" value="<%session.getAttribute("pw");%>">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5>
						<td colspan="2">
						<input class="form-control" type="hidden" id="name" name="name" maxlength="20" value="<%session.getAttribute("name");%>">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>전화번호</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="tel" name="tel" maxlength="20" vvalue="<%session.getAttribute("tel");%>">
						</td>
					</tr>
					<tr>
						<td style="text-align: right" colspan="3">
						<input class="btn btn-primary pull-right" type="submit" value="회원 정보 수정">
						</td>
					</tr>
			</table>
		</form>
	</div>


</body>
</html>