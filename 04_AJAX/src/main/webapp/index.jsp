<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX(Asynchronous JavaScript And XML)</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<h1>AJAX(Asynchronous JavaScript And XML)</h1>
	<h2>1. JavaScript를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>

	<button onclick="jsAjaxTest1();">GET 방식 전송</button>

	<p id="p1"></p>

<!-- GET 방식 -->
	<script>
		function jsAjaxTest1(){
			// 1. XMLHttpRequest 객체 생성 
			let xhr = new XMLHttpRequest();
			
			// 2. onreadystatuschange 속성에 콜백 함수 지정 			
			xhr.onreadystatechange = function(){
				
				//1) 서버 응답 상태 확인
				// 0 : 요청이 초기화되지 않은 상태
				// 1 : 서버와 연결이 설정된 상태
				// 2 : 서버가 요청을 받은 상태
				// 3 : 서버가 요청을 처리하는 상태
				// 4 : 서버가 요청에 대한 처리를 끝내고 응답을 준비하는 상태
				
				console.log('readyState : '+xhr.readyState);
			
				if(xhr.readyState == 4){
				//2) HTTP 응답 상태 코드 확인
				//	200 : OK
				//	404 : Not Found
				//	500 : Internal Server Error
				//	...
				
				console.log('status : '+xhr.status);
				
					if(xhr.status === 200){
						//서버에서 응답한 데이터를 담고있는 속성					
						console.log(xhr.responseText);
	// 					console.log('통신 성공 : '+xhr.status);
						
						document.getElementById("p1").innerHTML = xhr.responseText;
					}else{
						console.log('통신 실패 : '+xhr.status);
					}
				}
			};
			
			// 3. open() 호출			
			xhr.open('GET',"${pageContext.request.contextPath}/jsAjax.do?name=이정훈&age=19",true);
			
			// 4. send() 호출
			xhr.send();
		};
	</script>

	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<button onclick="jsAjaxTest2();">POST 방식 전송</button>
	
	<p id="p2"></p>

<!-- POST 방식 -->
	<script>
		function jsAjaxTest2(){
			// 1. XMLHttpRequest 객체 생성
			// 브라우저에서 xmlhttprequest 객체를 만들어 준다.
			let xhr = new XMLHttpRequest();
			
			// 2. onreadystatuschange 속성에 콜백 함수 지정 
			xhr.onreadystatechange = ()=>{
				
				/* XMLHttpRequest.DONE는 앞에서 작성한 jsAjaxTest1()의 코드와 같다. */
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						console.log('통신 성공'+xhr.status);
						
						document.getElementById("p2").innerHTML = xhr.responseText;
					}else{
						console.log('통신 실패'+xhr.status);
					}
				}
				
				/* readyState에서 State 대문자 S조심~! */
				console.log(xhr.readyState);
				
			};
			
			xhr.open('POST','${pageContext.request.contextPath}/jsAjax.do',true);
			
			/* POST 요청의 경우 send() 메소드 호출 전에 아래와 같이 요청 헤더를 추가해야 한다. */
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			
			/* POST 방식은 body에 값을 전송받기 때문에 send()메소드에 실어보내야한다. */
			xhr.send("name=홍길동&age=24");
		}
	</script>

	<h2>2. jQuery를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<label for="input">입력 :</label> 
	<input type="text" id="input" size="30px">

	<br><br>

	<label for="output">출력 :</label> 
	<input type="text" id="output" size="70px" readonly>

	<br><br>
	
	<button id="btn1">GET 방식 전송</button>
	
	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<label for="name">이름 : </label>
	<input type="text" id="name">
	
	<br>
	
	<label for="age">나이 : </label>
	<input type="text" id="age">
	
	<br>
	
	<label for="output2">출력 : </label>
	<input type="text" id="output2" size="30px" readonly>
	
	<br><br>
	
	<button id="btn2">POST 방식 전송</button>

	<h3>3) 서버에 데이터 전송 후 응답을 객체(object)로 받기</h3>
	
	<label for="userNo">회원 번호 : </label>
	<input type="text" id="userNo">

	<button id="btn3">조회</button>

	<p id="p3"></p>

	<h3>4) 서버에 데이터를 전송 후, 응답을 리스트(List)로 받기</h3>

	<label>
		<input type="radio" name="gender" value="남자" checked>남자
	</label>
	<label>
		<input type="radio" name="gender" value="여자">여자
	</label>
	
	<button id="btn4">조회</button>
	
	<p id="p4"></p>
	

	<script>
		$(document).ready(function(){
			
			/* GET 방식 */
			$('#btn1').on('click',function(){
				let input = $('#input').val();
				$.ajax({
					// 전송 방식(GET,POST)
					type: 'GET',
					// 요청 URL
					url: '${pageContext.request.contextPath}/jqAjax1.do',
					// 요청 시 전달할 파라미터 data 설정
					data: {
						input //'input' : input 변수의 값을 가져온다.
					},
					// AJAX 통신 성공 시 실행될 콜백 함수
					success: function(data){
						console.log(data);
						$('#output').val(data);
					},
					// AJAX 통신 실패 시 실행될 콜백 함수
					error: function(error){
						console.log(error);
					},
					// AJAX 통신 성공 여부와 상관없이 실행될 콜백 함수
					complete: function(complete){
						console.log("complete 콜백 함수 실행");
					}
				});
			});
			
			/* POST 방식 */
			$('#btn2').on('click',function(){
				let name = $('#name').val();
				let age = $('#age').val();
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/jqAjax1.do',
					data : {
						'name':name,
						age // 'age':age와 동일하다.
					},
					success:(data)=>{
						console.log(data);
						$('#output2').val(data);
					},
					error:(error)=>{
						console.log(error);
					}
				});
			});
			
			<!-- json GET 방식 -->
			$('#btn3').on('click',function(){

				let userNo = $('#userNo').val();

// 				alert('버튼 클릭~!'+userNo);
				
				$.ajax({
					
					type : 'GET',
					url : '${pageContext.request.contextPath}/jsonAjax.do',
					dataType : 'json', // 응답 데이터 형식
					data : {
						userNo 	//'userNo':userNo와 같다.
					},
					success:(obj)=>{
						let result = '';						
						
						console.log(obj);
						
						if (obj !== null) {
							result = '회원 번호 : ' + obj.no + 
									'<br>이름 : '+ obj.name+
									'<br>나이 : '+ obj.age+
									'<br>성별 : ' + obj.gender; 
						}else {
							result = '사용자 정보가 없습니다.';
						}
						$('#p3').html(result);
					},
					error:(error)=>{
						console.log(error);
					}
				});
// 				userNo.open();
			});
			
			<!-- json POST 방식 -->
			$('#btn4').on('click',function(){
				
				let gender = $('input[name=gender]:checked').val();
				
				console.log(gender);
				
// 				alert('버튼 클릭'+gender);
				
				$.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/jsonAjax.do',
					dataType:'json',
					data:{
						gender//'gender':gender와 동일
					},
					success:(list)=>{
					
						let result = "";
						
						console.log(list);

						/* 제이쿼리의 each 반복 메소드를 사용해서 list의 i인덱스에 접근한다. /each 메소드 첫번째 매개값은 인덱스 값, 두번째 매개값은 item 값이다. */
						$.each(list,(i)=>{
							result += '회원 번호 : ' + list[i].no + 
									'<br>이름 : '+ list[i].name+
									'<br>나이 : '+ list[i].age+
									'<br>성별 : ' + list[i].gender+
									'<br><br>';
						});
					$('#p4').html(result);
					},
					error:(error)=>{
						console.log(error);
					}
				});
			});
		});
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>