package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿을 등록하고, URL 매핑을 하는 작업을 수행한다.
//@WebServlet("/second.do")
@WebServlet(name = "second", urlPatterns = "/second.do")

public class SecondServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    public SecondServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		현재 실행중인 웹 어플리케이션의 경로
		System.out.println(request.getContextPath());
//		서버의 이름
		System.out.println(request.getServerName());
//		서버 포트
		System.out.println(request.getServerPort());
//		현재 실행중인 웹 어플리케이션의 요청된 servletPath 
		System.out.println(request.getServletPath());
//		request.getRemoteAddr() : 요청하는 클라이언트의 ip주소
		System.out.println(request.getRemoteAddr());
		
//		한글이 깨지는 것을 방지하기 위해서 response 응답 객체에 ContentType 응답 헤더를 설정하는 메소드이다.
		response.setContentType("text/html;charset=UTF-8");
		
//		응답 화면을 출력하기 위한 출력 스트림을 얻어온다.
		PrintWriter out = response.getWriter();
		
//		자바 코드로 응답 화면을 작성하는 과정이다.
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>우리가 만든 두 번째 서블릿이 반환한 내용.</h1>");
		out.write("</body>");
		out.write("</html>");
		
	}
	
	
	
	
	
	
	
	
	
	

}
