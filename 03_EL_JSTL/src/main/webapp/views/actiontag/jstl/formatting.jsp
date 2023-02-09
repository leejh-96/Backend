<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formattion</title>
</head>
<body>
	<h1>JSTL Formatting Library</h1>
	
	톰캣 서버의 Locale : ${pageContext.response.locale}<br>
	
	<%--
	 	<fmt:setLocale value="ja_JP"/>
		<fmt:setLocale value="en_US"/>
	--%>
	
	톰캣 서버의 Locale : ${pageContext.response.locale}<br>
	
	
	<h2>1. fmt:formatNumber</h2>
	<p>숫자 데이터의 출력 형식을 지정할 때 사용하는 태그이다.</p>
	
	<!-- 
		fmt:formatNumber의 기본값은 groupingUsed="true"이다. 
		groupingUsed : 숫자 단위의 구분자(,)로 표시 여부 지정(기본값: true)을 한다. -> 숫자 그대로를 출력하고 싶다면 groupingUsed를 false로 설정한다.
	-->
	숫자 그대로 출력 : <fmt:formatNumber value="1234567890000000" groupingUsed="false"/><br>
	세 자리마다 구분하여 출력 : <fmt:formatNumber value="1234567890000000000" groupingUsed="true"/><br><br>
	
	<!-- 
		pattern : 화면에 표시할 숫자 데이터의 패턴을 지정한다.
		#,0을 패턴 기호로 사용하여 지정한다.
		패턴 기호가 부족한 부분에 대해서는 #은 표시하지 않지만 0은 0으로 표시한다. 
		패턴 기호를 초과하는 부분은 반올림된다.
	-->
	
	<fmt:formatNumber value="1.23" pattern="#.###"/><br>
	<fmt:formatNumber value="1.23" pattern="0.000"/><br>
	<!-- 초과되는 숫자에 대해서는 반올림을 해준다. --><br><br>
	<fmt:formatNumber value="54654651.2346" pattern="#.###"/><br>
	<fmt:formatNumber value="54654651.2346" pattern="0.000"/><br>
	
	<!--type 속성 : number(숫자, 기본값), currency(통화), percent(백분율)-->
	<br><br>
	<!-- type을 생략하면 기본값으로 number로 설정된다. -->
	숫자 : <fmt:formatNumber type="number" value="50000"/><br>
	숫자 : <fmt:formatNumber value="50000"/><br>
	<!-- type="currency"는 현재 pc가 있는 지역의 통화기호로 기본값이 설정된다. currencySymbol="$" 로 통화를 지정해 줄 수 있다. -->
	통화 : <fmt:formatNumber type="currency" value="50000"/><br>
	통화 : <fmt:formatNumber type="currency" value="50000" currencySymbol="$"/><br>
	백분율 : <fmt:formatNumber type="percent" value="0.7"/>
	
	<h2>2. fmt:formatDate 태그</h2>
	<p>날짜나 시간 데이터의 출력 형식을 지정하기 위해 사용하는 태그이다.</p>
	
	<c:set var="date" value="<%= new Date() %>"/>
	
	<ul>
		<li>날짜 : <fmt:formatDate value="${date }"/> </li>
		<li>날짜 : <fmt:formatDate type="date" value="${date }"/></li>
		<li>시간 : <fmt:formatDate type="time" value="${date }"/></li>
		<li>날짜와 시간 : <fmt:formatDate type="both" value="${date }"/></li>
		<li>날짜와 시간(short) : <fmt:formatDate type="both" value="${date }" dateStyle="short" timeStyle="short"/></li>
		<li>날짜와 시간(medium) : <fmt:formatDate type="both" value="${date }" dateStyle="medium" timeStyle="medium"/></li>
		<li>날짜와 시간(long) : <fmt:formatDate type="both" value="${date }" dateStyle="long" timeStyle="long"/></li>
		<li>날짜와 시간(full) : <fmt:formatDate type="both" value="${date }" dateStyle="full" timeStyle="full"/></li>
		<li>날짜와 시간(pattern) : <fmt:formatDate type="both" value="${date }" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"/></li>
	</ul>	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>