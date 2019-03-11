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
			
			/* 로그인한 id를 검색하여 
			    로그인한 회원의 이름과 일치하는지 확인*/
			$("#buyerName").keyup(function() {
			
				/* id에 세션에 등록된 값 저장 */
				var id = "<%=(String)session.getAttribute("id")%>";
				 var buyerName = $("#buyerName").val();
		            
		            if(buyerName.length < 2) {
		               $("#buyerNameCheck").text("예약자명을 정확히 입력해주세요");
		            } else {
		               $.ajax({
		                  url: "nameCheck",
		                  type: "POST",
		                  data: {
		                     id: id,
		                     name: buyerName
		                  },
		                  success: function (result) {
		                     var nameCheck = $(result).text();
		                     console.log(nameCheck);
		                     $("#buyerNameCheck").text(nameCheck);
		                  }
		               });   //   end ajax
		               
		            }   //   end if
		         }); //   end keyup(#buyerName)
		         
		         //   입력한 휴대폰 확인
		         $("#tel").keyup(function() {
		            var tel = $("#tel").val();
		            
		            var telCheck = tel.substring(3, 4);
		            var telCheck1 = tel.substring(8, 9);
		            
		            if(tel.length == 13) {
		               if(telCheck == "-" && telCheck1 == "-") {
		                  $("#telCheck").text(tel);
		                  
		                  var tel = $("#tel").val();
		                  $("#inpTel").val(tel);
		                  
		                  //   앞뒤의 공백을 제거(String.trim())
		                  var buyerNameCheck = $("#buyerNameCheck").text().trim();
		                  console.log(buyerNameCheck);
		                  
		                  //   예약하기 버튼 활성화
		                  if($("#buyerName").val() == buyerNameCheck && $("#tel").val() != ""){
		                     $("#btn").attr("disabled", false);
		                     
		                     //   예약 정보 hidden 타입의 input value에 저장
		                     var name = $("#name").text();
		                     var lodge = $("#lodgeName").text();
		                     var addr = $("#addr").text();
		                     var price = $("#price").text();
		                     var inDay = $("#inDay").text();
		                     var outDay = $("#outDay").text();
		                     var buyerName = $("#buyerName").val();
		                     
		                     $("#inpName").val(name);
		                     $("#inpLodgeName").val(lodge);
		                     $("#inpAddr").val(addr);
		                     $("#inpBuyerName").val(buyerName);
		                     $("#inpInDay").val(inDay);
		                     $("#inpOutDay").val(outDay);
		                     $("#inpPrice").val(price);
		                  }
		                  
		               } else {
		                  $("#telCheck").text("전화번호는 -를 포함시켜 입력해주세요");
		               }   //   end if
		               
		            } else {
		               $("#telCheck").text("전화번호는 -를 포함한 13자리를 입력해주세요");
		            }   //   end if
		         });   //   end keyup(#tel)
		         
		      });   //   jquery
	</script>
</head>

<body>
	<%
		String id = (String) session.getAttribute("id");
		String hName = request.getParameter("hName");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String inDay = request.getParameter("inDay");
		String outDay = request.getParameter("outDay");
		String img = request.getParameter("img");
		String addr = request.getParameter("location");
		
	%>

	<jsp:include page="resources/includes/header.jsp" flush="false"/>
		<div class="container ie-h-align-center-fix">
			<div class="container tm-pt-5 tm-pb-4">
            	<div class="row text-center">
					<img src="<%= img %>" width="250px" height="180">
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<table>
						<tr align="left" id="name"><td><h4><%= name %></h4></td></tr>
						<tr align="left" id="lodgeName"><td><%= hName %></td></tr>
						<tr align="left" id="addr"><td><p><%= addr %></p></td></tr>
						<tr align="left" id="price"><td><p><%= price %></p></td></tr>
					</table>					
             	</div>
			</div>
		
		<hr color="orange">
		<p>입실 날짜: </p><h5 id="inDay"><%= inDay %></h5><br>
		<p>퇴실 날짜: </p><h5 id="outDay"><%= outDay %></h5><br>
		
		<hr color="orange">
		<font color="blue" size="4">필수 입력 사항</font> <br>
		<p>예약자명 &nbsp; <input type="text" id="buyerName" name="buyerName"></p> <br>
		<h4 id="buyerNameCheck"></h4><br>
		<p>휴대전화 &nbsp; <input type="text" id="tel" name="tel"></p> 
		<h4 id="telCheck"></h4><br>
		
		<hr color="orange">
		<font color="blue" size="4">결제 방식 선택</font> <br> <br>
		<input type="radio" name="payment" id="card" value="card" checked="checked"> 카드
		<p><font color="red">※결제는 카드 결제만 가능합니다.</font></p>
		
		
		
		<center>
			<form action="payment.jsp" method="get">
				<input type="hidden" id="inpName" name="name">
				<input type="hidden" id="inpLodgeName" name="lodge">
				<input type="hidden" id="inpAddr" name="addr">
				<input type="hidden" id="inpPrice" name="price">
				<input type="hidden" id="inpBuyerName" name="buyerName">
				<input type="hidden" id="inpTel" name="tel">
				<input type="hidden" id="inpInDay" name="inDay">
				<input type="hidden" id="inpOutDay" name="outDay">
				<button type="submit" class="btn btn-primary tm-btn-search" disabled="disabled" id="btn">예약하기</button>
			</form>
		</center>
		
		<br>
		
	</div>
</body>
</html>