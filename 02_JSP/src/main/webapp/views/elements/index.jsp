<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소</title>
</head>
<body>
	<h1>JSP 스크립트 요소</h1>

	<!-- HTML 주석 -->

	<%-- JSP 주석 --%>
	<%-- 
		두 주석의 차이점은 
		페이지 소스 보기 혹은 개발자 도구에서 HTML 주석은 확인이 가능하고 JSP 주석은 확인이 불가능하다. 
	--%>

	<%-- 선언문 태그 --%>
	<%! 
		private String name = "이정훈";
	
		public String getName(){
			return this.name;
		}
	%>

	<%-- 스크립트릿 태그 --%>
	
	<%
		int sum=0;
	
		for(int i=1; i<=10; i++){
			sum += i;
			
	%>
	<h2>안녕하세요.</h2>
	<%	
		}
		System.out.println(sum);
	%>
	
	<!-- 표현식 태그 -->
	
	저의 이름은 <%=getName() %><br>
	저의 이름은 <%=name %><br>

	1부터 10까지의 합은 <% out.print(sum); %><br>
	1부터 10까지의 합은 <%= sum %><br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>