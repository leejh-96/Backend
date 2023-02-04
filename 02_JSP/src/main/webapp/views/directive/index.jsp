<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ 
	include file="/views/common/header.jsp" 
%>
	<section>
		<h2>개인 정보 입력</h2>
		<form action="userFormResult.jsp" method="POST">
	
			<label for="userName">이름 : </label>
			<input type="text" name="userName" id="userName"><br>
			
			<label for="userAge">나이 : </label>
			<input type="text" name="userAge" id="userAge"><br>
			
			<label><input type="radio" name="gender" value="남자" checked>남자</label>	
			<label><input type="radio" name="gender" value="여자">여자</label>
			
			<br><br>
			
			좋아하는 음식 : 
			<label><input type="checkbox" name="food" value="한식" checked>한식</label>
			<label><input type="checkbox" name="food" value="분식">분식</label>
			<label><input type="checkbox" name="food" value="중식">중식</label>
			<label><input type="checkbox" name="food" value="일식">일식</label>
			
			<br><br>
			
			<input type="submit" value="전송">
			<input type="reset" value="취소">
		</form>
	</section>
	
<%@ 
	include file="/views/common/footer.jsp" 
%>