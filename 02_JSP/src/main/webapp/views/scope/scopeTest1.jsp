<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest1</title>
</head>
<body>
	<h2>Session 영역과 Application 영역의 비교</h2>
	
	현재 Session 영역에 저장된 데이터 : <%=session.getAttribute("address") %><br>
	현재 Application 영역에 저장된 데이터 : <%=application.getAttribute("name") %><br>
	
</body>
</html>