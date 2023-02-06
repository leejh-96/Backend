<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope</title>
</head>
<body>
	<h1>영역(Scope) 객체</h1>
	
	<h2>Session 영역과 Application 영역의 비교</h2>
	<%
		session.setAttribute("address", "경기도 광주시");
		application.setAttribute("name", "이정훈");
	%>
	<a href="scopeTest1.jsp">View Details</a>	
	
	<h2>Page 영역과 Request 영역의 비교</h2>
	<a href="scopeTest2.jsp">View Details</a>	
	
</body>
</html>