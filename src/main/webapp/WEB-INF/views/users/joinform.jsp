<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입폼</title>
	<script src="<c:url value="/javascript/user.js" />"></script>
</head>
<body>
	<h1>회원 가입</h1>
	
	<form
		id="join-form"
		name="registerForm" 
		action="<c:url value="/users/join" />"
		method="POST"
		>
		<label for="name">이름</label>
		<input name="name" type="text" placeholder="이름을 입력하십시오"><br>
		<!-- name 필드 에러 메시지 -->
		<spring:hasBindErrors name="userVo">
			<c:if test="${errors.hasFieldErrors('name') }">
				<strong style="color:red;">
				${errors.getFieldError('name').defaultMessage }
				</strong>
			</c:if>
		</spring:hasBindErrors>
		
		<label for="password">비밀번호</label>
		<input name="password" type="password" placeholder="비밀번호를 입력하십시오"><br>
		<!-- 비밀번호 에러 메시지 -->
		<spring:hasBindErrors name="userVo">
			<c:if test="${errors.hasFieldErrors('password') }">
				<strong style="color:red;">
				${errors.getFieldError('password').defaultMessage }
				</strong>
			</c:if>
		</spring:hasBindErrors>
		
		<label for="email">이메일</label>
		<input type="text" name="email" placeholder="이메일을 입력하십시오.">
		<!-- 이메일 필드 에러 메시지 -->
		<spring:hasBindErrors name="userVo">
			<c:if test="${errors.hasFieldErrors('email') }">
				<strong style="color:red;">
				${errors.getFieldError('email').defaultMessage }
				</strong>
			</c:if>
		</spring:hasBindErrors>
		
		<input type="button" id="check-email"
			data-target="<c:url value="/users/checkEmail" />"
			value="이메일 중복체크" />
		<input type="hidden" name="emailCheck" value="n" />
		<br>
	
		<label for="gender">성별</label>
		<input type="radio" name="gender" value="M" checked>남성</radio>
		<input type="radio" name="gender" value="F">여성</radio><br>
		
		<label for="agree">약관동의</label>
		<input type="checkbox" id="agree" name="agree" value="n" />
		
		<input type="submit" value="전송"> 
	
	</form>
	
</body>
</html>