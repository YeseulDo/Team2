<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap.min.js -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
	/* login */
			.modal-login {
			width: 350px;
			}
		
			.modal-login .modal-content {
				padding: 20px;
				border-radius: 1px;
				border: none;
			}
			
			.modal-login .modal-header {
				border-bottom: none;
				position: relative;
				justify-content: center;
			}
			
			.modal-login h4 {
				text-align: center;
				font-size: 26px;
			}
			
			.modal-login .form-control, .modal-login .btn {
				min-height: 40px;
				border-radius: 1px;
			}
			
			.modal-login .close {
				position: absolute;
				top: -5px;
				right: -5px;
			}
			
			.modal-login .btn {
				background: #3498db;
				border: none;
				line-height: normal;
				font-size: 1.25rem;
			}
			
			.modal-login .btn:hover, .modal-login .btn:focus {
				background: #248bd0;
			}
			
			.modal-login .hint-text, .modal-login .hint-text a{
				color: #14ba9a;
				font-size: 12px;
				font-weight: bold;
				line-height: 3;
				margin: 0 7px;
			}
			
			.trigger-btn {
				display: inline-block;
			}
			
			.help-block {
				color: red;
				font-size: 11px;
			}
</style>
<body>
   <nav class="navbar navbar-expand-md navbar-transparent fixed-top sticky-navigation navbar-light bg-white shadow-bottom" id="lambda-navbar">
       <a class="navbar-brand" href="${contextPath }/index.jsp">
           TEAM2 WAREHOUSE
       </a>
       <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
           <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
       </button>
       <div class="navbar-collapse collapse" id="navbarCollapse" style="">
           <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#company">회사소개</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#houseinfo">이용안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="${contextPath }/re/info.me?warehouse=A">예약안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#market">중고장터</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#faq">FAQ</a>
               </li>
              	<c:set var="email" value="${sessionScope.mdto.email }"/>
	          	<c:set var="name" value="${sessionScope.mdto.name }"/>
	          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
	         	
				<c:if test="${admin == 1 }">
	        		<li class="nav-item">
	                	<a class="nav-link page-scroll" href="#">관리자</a>
	            	</li> 
	            </c:if>
	           	<c:choose>
	               	<c:when test="${email ne null }">
	               		<li class="nav-item">
	                   		<a class="nav-link page-scroll" href="${contextPath }/member/mypage.jsp">마이페이지</a>
	               		</li>               
	              		<a href="${contextPath }/me/logout.me" class="btn btn-primary btn-navbar">${name }님 환영합니다. 로그아웃 <i class="fas fa-sign-out-alt"></i></a>
	               	</c:when>
	               	<c:otherwise>
	               		<div class="text-center">
							<a href="#loginModal" class="btn btn-primary btn-navbar trigger-btn" data-toggle="modal">로그인/회원가입</a>
						</div>
	              	</c:otherwise>
	       		</c:choose>
              </ul>
        </div>
    </nav>
    <div id="loginModal" class="modal fade">
				<div class="modal-dialog modal-login">
					<div class="modal-content">
						<div class="modal-header">				
							<h4 class="modal-title">LOGIN</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<form action="${contextPath }/me/login.me" method="post" onsubmit="return login()">
								<div class="form-group">
									<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL">
									<span id="emailErr" class="help-block"></span>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
									<span id="pwErr" class="help-block"></span>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-block btn-lg" value="LOGIN">
								</div>
							</form>
							<div class="remember">
								<input type="checkbox" id="emailSaveCheck"><span class="text-muted hint-text">이메일 기억</span>
							</div>	
							<div class="hint-text">			
								<span><a href="${contextPath }/member/findMember.jsp?find=email">이메일찾기</a></span> | 
								<span><a href="${contextPath }/member/findMember.jsp?find=pwd">비밀번호찾기</a></span> | 
								<span><a href="${contextPath }/member/join.jsp">회원가입</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
   