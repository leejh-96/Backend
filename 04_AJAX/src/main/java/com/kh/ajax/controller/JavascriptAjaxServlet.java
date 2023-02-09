package com.kh.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jsAjax.do")
public class JavascriptAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JavascriptAjaxServlet() {
    }
    
	@Override	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		System.out.println(name+", "+age);
		
		response.setContentType("text/html;charset=UTF-8");
		
		response.getWriter().append("서버에서 전송할 값<br>").append(name+", "+age);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		POST방식에서 xhr.setRequestHeader에 charset="UTF-8"을 넣어주면 된다.
//		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		System.out.println(name+", "+age);
		
		response.setContentType("text/html;charset=UTF-8");
		
		response.getWriter().append("서버에서 전송할 값<br>").append(name+", "+age);
	
	}

}
