<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String year = "2023";
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includePage</title>
</head>
<body>
	<h2>Include 페이지</h2>
	
	includePage.jsp의 year 변수 값은 <%=year %>입니다.
	
	pName : ${param.pName }<br>
	
</body>
</html>