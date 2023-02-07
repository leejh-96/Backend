<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:include</title>
</head>
<body>
	<h1>jsp:include 액션 태그</h1>
	<p>
		include 액션 태그는 다른 페이지를 포함 시킬 때 사용하는 액션 태그이다.
	</p>
	
	<h2>1. include 지시어</h2>
	<p>
		다른 페이지를 포함하는 JSP 파일이 컴파일 되기 전에 아래의 페이지가 삽입된다.
	</p>
<%-- 	<%@include file="includePage.jsp" %> --%>
<!--  		String year ="2024"; -->
	
	<h2>2. include 액션 태그</h2>
	<p>
		다른 페이지를 포함하는 JSP 파일이 화면에 출력되는 시점(런타임)에 삽입된다.
	</p>
	<jsp:include page="includePage.jsp"/>	
	<% String year ="2024"; %>	
	<br>
	include.jsp 페이지의 year 변수 값은 <%=year %>입니다.<br>
	
	<br><br>
	
	<!-- jsp:param 액션 태그를 이용해서 포함되는 페이지로 값을 전달할 수 있다. -->
	<jsp:include page="includePage.jsp">
		<jsp:param name="pName" value="아이폰 12 미니" />
	</jsp:include>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>