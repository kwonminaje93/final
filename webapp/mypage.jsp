<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

	<div class="memberInfo">
		<form method="post" action="memberSelect.do">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" ><h4 style="text-align: center">회원 정보 확인</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="id" name="id" maxlength="20">
						</td>
					</tr>
					<tr>
						<td style="text-align: right" colspan="3">
						<input class="btn btn-primary pull-right" type="submit" value="회원 정보 보기">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div class="memberUpdate">
		<form method="post" action="mUpdate.jsp">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2">
						<input class="form-control" type="password" id="pw" name="pw" maxlength="20">
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

	<div class="memberDelete">
		<form method="post" action="memberDelete.do">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2">
						<input class="form-control" type="password" id="pw" name="pw" maxlength="20">
						</td>
					</tr>
					<tr>
						<td style="text-align: right" colspan="3">
						<input class="btn btn-primary pull-right" type="submit" value="회원 정보 삭제">
						</td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>