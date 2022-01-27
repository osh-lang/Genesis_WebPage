<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset=UTF-8">
<title>2021. 4. 20.오전 10:46:16</title>
</head>
<body>
	<h1>sample/all</h1>
	<p><a href="member">member</a>
	<p><a href="admin">admin</a>
	
	<sec:authorize access="isAnonymous()">
	<p><a href="/customLogin">로그인</a></p>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<p><a href="/customLogout">로그아웃</a></p>
	</sec:authorize>
</body>
</html>