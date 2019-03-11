<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="resources/includes/header.jsp" flush="false"/>
	<div class="container ie-h-align-center-fix">
		<div class="container tm-pt-5 tm-pb-4">
                <div class="center">
					<form action="memInsert" method="post">
						<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
							<thead>	
								<tr>
									<th colspan="3" ><h4 style="text-align: center">회원 정보 입력</h4>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 110px;"><h5>아이디</h5>
									<td>
									<input class="form-control" type="text" id="id" name="id" maxlength="20" required="required" placeholder="아이디를 입력해주세요.">
									</td>
								<tr>
									<td style="width: 110px;"><h5>비밀번호</h5>
									<td colspan="2">
									<input class="form-control" type="password" id="userPassword1" name="pw" maxlength="20" required="required" placeholder="비밀번호를 입력해주세요.">
									</td>
								</tr>
								<tr>
									<td style="width: 110px;"><h5>이름</h5>
									<td colspan="2">
									<input class="form-control" type="text" id="name" name="name" maxlength="20" required="required" placeholder="이름을 입력해주세요.">
									</td>
								</tr>
								<tr>
									<td style="width: 110px;"><h5>전화번호</h5>
									<td colspan="2">
									<input class="form-control" type="tel" id="tel" name="tel" maxlength="20" required="required" placeholder="전화번호를 입력해주세요.">
									</td>
								</tr>
								<tr>
									<td style="text-align: right" colspan="3">
									</td>
								</tr>
							</tbody>
						</table>
						<input class="btn btn-primary pull-right" type="submit" value="회원가입">
					</form>
				</div>
			</div>
		</div>
</body>
</html>