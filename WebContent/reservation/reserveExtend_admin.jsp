<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>RESERVATION - TEAM2 WAREHOUSE</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

        <!--Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!--vendors styles-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
		<!-- jQuery UI CSS파일 --> 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
		<!-- jQuery 기본 js파일 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<!-- jQuery UI 라이브러리 js파일 -->
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
		
		
        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="../css/default.css" id="theme-color">
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		
		<style type="text/css">
			.table tr>td:not(.confirm){
				text-align: center;
			}
			.red{
				color: #ff3333;
			}
			.confirm{
				text-align: right;
			}
	
		</style>
 
</head>

<body>
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7 bg-light">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">EXTENSION</span>
	                <h2 class="display-4">예약 연장 확인</h2>
	                <p class="lead">성공적으로 예약되셨습니다!</p>
	            </div>
			</div>
		  
		  <div class="my-3 p-3 bg-white rounded shadow-sm">
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td>
			    			<input type="text" class="form-control-plaintext" value="${param.name}(${param.email})" readOnly>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="phone" value="${param.phone}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="house" value="${param.house}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">총 사용 기간</p></td>
			    		<td>
				    		<input type="text" class="form-control-plaintext" value="${param.start_day} ~ ${param.end_day} (${param.totalDay}일 연장)">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><p class="text-info font-weight-bold pt-2 m-0">추가 보증금<br><small class="text-muted">비용의 10%</small></p></td>
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="text-info font-weight-bold pt-2 m-0">추가 금액<br></p></td>
			    		<td><input type="text" class="form-control-plaintext" value="${param.payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">총 납부 금액<br><small class="text-muted">고객님이 결제하신 총 금액</small></p></td>
		    	<c:choose>
			    	<c:when test="${param.state =='reservation'}">
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment}" readOnly></td>
			    	</c:when>
			    	<c:when test="${param.state =='items'}">
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment + param.payment}" readOnly></td>
			    	</c:when>
		    	</c:choose>
			    	</tr>
			    	<tr>
			    		<td colspan="2">
			    			<a href="../index.jsp" class="btn btn-primary">메인으로 돌아가기</a>
			    		</td>
			    	</tr>
			    </table>
		  </div>		
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
        

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    </body>
</html>
