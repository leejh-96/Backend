<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.el.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Operators</title>
</head>
<body>
	<h1>EL 연산자</h1>
	
	<h2>1. 산술 연산자</h2>
	10+5 = ${10+5 }<br>
	10-5 = ${10-5 }<br>
	10*5 = ${10*5 }<br>
<%-- 	10/5 = ${10/5 } 또는 ${10 div 5 }<br> --%>
	10%5 = ${10%7 } 또는 ${10 mod 7 }<br>
	
	<h2>2. 논리 연산자</h2>
	true && false = ${true&&false } 또는 ${true and false }<br>
	true || false = ${true||false } 또는 ${true or false }<br>
	!(10 > 5) = ${!(10 > 5)}  또는 ${not(10 > 5) }<br>
	
	<h2>3. 비교 연산자</h2>
	<h3>1) 객체 동등 비교</h3>
	<%
	/* EL은 영역 객체의 속성(Attribute)에 접근해서 값을 가져오기 때문에 스크립트릿에 선언된 변수는 가져올 수 없다. */
		String str1 = "안녕";
		String str2 = new String("안녕");
		Student student1 = new Student("이정훈",20,80,80);
		Student student2 = new Student("문인수",19,100,100);
	
		System.out.println(str1==str2);	
		System.out.println(str1.equals(str2));
	
	/* Page 영역에 데이터를 저장 */
		pageContext.setAttribute("str1", str1);
		pageContext.setAttribute("str2", str2);
		pageContext.setAttribute("student1", student1);
		pageContext.setAttribute("student2", student2);
	
	%>
	<%-- 
	str1 : ${str1 }<br>
	str2 : ${str2 }<br>
	student1 : ${student1.name },${student1.age },${student1.math },${student1.english }<br>
	student2 : ${student2 }<br> 
	--%>
	<table border="1">
		<tr>
			<th>비교식</th>
			<th>표현식 태그</th>
			<th>EL 태그</th>
		</tr>
		<tr>
			<td>str1==str2</td>
			<td><%=str1==str2 %></td>
			<td>${str1 == str2 } : EL 에서의 ==동등 연산은 equals()를 실행시킨 결과와 같다. 또는( ${str1 eq str2 })</td>
		</tr>
		<tr>
			<td>str1!=str2</td>
			<td><%=str1!=str2 %></td>
			<td>${str1!=str2 } : EL 에서의 !=동등 연산은 equals()를 실행시킨 결과와 같아서 false가 나온다. 또는 (${str1 ne str2})</td>
		</tr>
		<tr>
			<td>student1 == student2</td>
			<td><%=student1 == student2 %></td>
			<td>${student1 == student2 } : EL 에서의 student 객체 ==동등 연산은 false가 나온다.또는 (${student1 eq student2})</td>
		</tr>
		<tr>
			<td>student1 != student2</td>
			<td><%=student1 != student2 %></td>
			<td>${student1 != student2 } : EL 에서의 student 객체 !=동등 연산은 true가 나온다.또는 (${student1 ne student2})</td>
		</tr>
	</table>	
	
	<h3>2) 숫자 비교 연산</h3>
	<%
// 		pageContext.setAttribute("big", "10");
		pageContext.setAttribute("big", 10);
		pageContext.setAttribute("small", 3);
// 		pageContext.setAttribute("small", 'a');/* EL에서 문자는 아스키 코드값으로 변환된다. */
	
	%>
	표현식 태그 : <%=(Integer)pageContext.getAttribute("big")+(Integer)pageContext.getAttributesScope("small") %><br>getAttribute()는 오브젝트 타입으로 받기 때문에 형변환을 해주어야한다.<br>
	표현식 태그 : <%=(Integer)pageContext.getAttribute("big")>(Integer)pageContext.getAttributesScope("small") %><br>getAttribute()는 오브젝트 타입으로 받기 때문에 형변환을 해주어야한다.<br><br>
	
	EL : ${big+small }<br>EL 에서는 오브젝트 타입을 자동으로 형변환을 해준다.<br>
	EL : ${big>small }<br>EL 에서는 오브젝트 타입을 자동으로 형변환을 해준다.<br><br>
	
	big &gt; small : ${big>small} 또는 ${big gt small }(gt)<br>
	big &lt; small : ${big<small} 또는 ${big lt small }(lt)<br>
	big &ge; small : ${big>=small} 또는 ${big ge small }(ge)<br>
	big &le; small : ${big<=small} 또는 ${big le small }(le)<br><br>
	
	<h3>3) 객체가 null 또는 비어있는지 체크하는 연산자</h3>
	
	<%
		String str3 = null;
		List<String> list= new ArrayList<>();
		
		list.add("안녕하세요.");
		
		System.out.println(list.isEmpty());
		
		pageContext.setAttribute("str3", str3);
		pageContext.setAttribute("list", list);
	%>
	
	표현식 태그 : str3 = null(<%=str3 == null %>) , list = null(<%=list.isEmpty() %>)<br>
	EL : str3 = null(${str3 == null }) , str3 = empty(${empty str3 })<br>
	<!-- list는 참조하는 인스턴스가 있다면 empty가 true가 나옴 -->
	EL : list = null(${list == null }) , list = empty(${empty list })<br>
	
	<br><br>
	
	EL : str3 = null(${str3 != null }) , str3 = empty(${not empty str3 })<br>
	<!-- list는 참조하는 인스턴스가 있다면 empty가 true가 나옴 -->
	EL : list = null(${list != null }) , list = empty(${not empty list })<br>
		
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
</body>
</html>