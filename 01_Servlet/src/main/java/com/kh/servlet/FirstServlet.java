package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 서버에서 서블릿을 실행하는 방법
 * 	1. 서블릿 클래스를 작성한다.
 * 		-javax.servlet.http.HttpServlet 클래스를 상속한다.
 * 		-doGet(), doPost() 메소드를 재정의한다.
 * 
 * 	2. 서블릿 등록 및 URL을 매핑한다.
 * 		-web.xml에 서블릿을 등록 및 URL을 매핑한다.
 * 		-@WebServlet으로 서블릿을 등록 및 URL을 매핑한다.
 * 	
 */

public class FirstServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("사용자로부터 GET 요청을 받음.");
		
//		한글이 깨지는 것을 방지하기 위해서 response 응답 객체에 ContentType 응답 헤더를 설정하는 메소드이다.
		response.setContentType("text/html;charset=UTF-8");
		
//		응답 화면을 출력하기 위한 출력 스트림을 얻어온다.
		PrintWriter out = response.getWriter();
		
//		자바 코드로 응답 화면을 작성하는 과정이다.
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>우리가 만든 첫 번째 서블릿이 반환한 내용.</h1>");
		out.write("</body>");
		out.write("</html>");
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
