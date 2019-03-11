<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	
	<script type="text/javascript">
	
		$(function() {
			$("#btn").click(function() {
				var id = "yis";
				var lodge = $("#lodge").text();
				var inDay = $("#inDay").text();
				var outDay = $("#outDay").text();
				var tel = $("#tel").text();
							
				//	가맹점 식별
				var IMP = window.IMP; 
				IMP.init("imp37103578"); // 가맹점 식별 코드
				
				//	결제창 호출
				IMP.request_pay({	// 	param: 결제 요청에 필요한 정보 기재
					pg: "html5_inicis", //	이니시스 웹 표준
					pay_method: "card",	//	결제 방법
					merchant_uid: $("#merchant_uid").text(),	//	가망점에서 생성/관리하는 고유 주문 번호, 중복 불가
					// 고유 주문 번호 ==> merchant_ + new Date().getTime;
					name: $("#name").text(),	//	상품 이름
					amount: $("#price").text(),	//	결제 금액
					buyer_name: $("#buyerName").text(),	//	결제 사용자 이름
					buyer_tel: $("#tel").text()	//	결제 사용자 전화번호
					
				}, function(rsp) {	//	callback: 결제 완료 or 결제 취소
					//	결제 성공시 로직
					if (rsp.success) {
						//	DB에 결제 정보 전달하기 전달하기
						$.ajax({
							//	가맹점 서버
							url: "reservation",
							type: "POST",
							data: {
								//	환불을 위해 아임포트에서 발급하는 상품 고유 id
								uid: rsp.imp_uid,
								//	상품 이름
								name: rsp.name,
								//	구매자 이름
								id: id,
								buyerName: rsp.buyer_name,
								//	구매자 전화번호
								tel: rsp.buyer_tel,
								//	구매 금액
								price: rsp.paid_amount,
								payDay: rsp.paid_at,
								inDay: inDay,
								outDay: outDay,
								//	결제 완료 여부: 1 --> 결제 완료, 0 --> 결제 미완료 or 결제 취소
								complete: "1",
								hName: lodge
								
							}, 
							success: function() {
								document.location.href="paymentComplete.jsp";
							}
						//	HTTP 요청이 성공하면 요청한 데이터가 done 메소드로 전달됨
						});		//	end ajax
					} 
					//	결제 실패시 로직
					else {
						alert("결제 실패. 에러 내용: " + rsp.error_msg);
					}
				});	//	request_pay
			});	//	end click
		});		//	end jquery
	</script>
</head>
<body>
	<jsp:include page="resources/includes/header.jsp" flush="false"/>
	
	<%
		/* 상품 고유 번호 생성하기 */
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(cal.YEAR));
		String month = String.valueOf(cal.get(cal.MONTH) + 1);
		String date = String.valueOf(cal.get(cal.DATE));
		String paidDate = year + month + date;
		DateFormat df = new SimpleDateFormat("hhmmss");
		int num = (int) (Math.random() * 100) + 1;
		String merchant_uid = "ORD"+paidDate+"-"+df.format(new Date()) + num;
		
		
		String name = request.getParameter("name");	//	상품 이름(숙박 업소 상품 이름)
		String lodge = request.getParameter("lodge");	//	숙박업소 이름
		String addr = request.getParameter("addr"); 	//	숙박업소 주소
		int price = Integer.parseInt(request.getParameter("price"));	//	가격
		String buyerName = request.getParameter("buyerName");	//	구매자 이름
		String tel = request.getParameter("tel"); 	//	구매자 전화번호
		String inDay = request.getParameter("inDay"); 	//	입실 날짜
		String outDay = request.getParameter("outDay");	//	퇴실 날짜
	
	%>
	
	<div class="container ie-h-align-center-fix">
		<div class="container tm-pt-5 tm-pb-4">
			<br>
			<h2><p>예약 정보</p></h2>
			
			<h5 "hidden" id="merchant_uid"><%= merchant_uid %></h5><br>
			
			<table border="0">
				<tr>
					<td width="150">상품 이름: </td>
					<td width="250" id="name"><%= name %></td>
				</tr>
				<tr>
					<td>숙박업소 이름: </td>
					<td id="lodge"><%= lodge %></td>
				</tr>
				<tr>
					<td>숙박업소 주소: </td>
					<td id="addr"><%= addr %></td>
				</tr>
				<tr>
					<td>가격: </td>
					<td id="price"><%= price %></td>
				</tr>
				<tr>
					<td>구매자 이름: </td>
					<td id="buyerName"><%= buyerName %></td>
				</tr>
				<tr>
					<td>구매자 전화번호: </td>
					<td id="tel"><%= tel %></td>
				</tr>
				<tr>
					<td>입실 날짜: </td>
					<td id="inDay"><%= inDay %></td>
				</tr>
				<tr>
					<td>퇴실 날짜: </td>
					<td id="outDay"><%= outDay %></td>
				</tr>
				
			</table>
			
			<hr color="orange">
			
			<h2><font color="red">취소 규정</font></h2>
			<table border="2">
				<tr align="center">
					<th width="50%">취소 기준</th>
					<th width="50%">취소 수수료</th>
				</tr>
				<tr align="center">
					<td>입실 1일 전 25시 전까지</td>
					<td>없음</td>
				</tr>
				<tr align="center">
					<td>당일 취소 및 입실 시간 경과/실제 입실후</td>
					<td>환불 불가</td>
				</tr>
			</table>
			<br>
			
			<center>
				<button type="submit" class="btn btn-primary tm-btn-search" id="btn">주문하기</button>
			</center>
		</div>
	</div>
</body>
</html>