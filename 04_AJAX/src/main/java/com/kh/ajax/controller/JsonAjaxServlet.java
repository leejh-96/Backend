package com.kh.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ajax.model.vo.User;


@WebServlet("/jsonAjax.do")
public class JsonAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JsonAjaxServlet() {
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 정보가 저장되어 있는 List 객체 생성
		List<User> list = new ArrayList<>();
		
		list.add(new User(1,"이정훈",20,"남자"));
		list.add(new User(2,"김철수",16,"남자"));
		list.add(new User(3,"김영희",16,"여자"));
		list.add(new User(4,"홍길동",20,"남자"));
		list.add(new User(5,"영심이",15,"여자"));
		list.add(new User(6,"왕경태",15,"남자"));
		
		int userNo = Integer.parseInt(request.getParameter("userNo")) ;
		
//		System.out.println(userNo);
		
//		리스트에서 사용자에게 입력받은 번호와 비교해서 같으면 사용자의 정보를 리턴, 번호와 같지 않으면 null을 리턴한다.
		User findUser = list.stream().
									filter(user->user.getNo() == userNo).
									findFirst().
									orElse(null);

		System.out.println(findUser);
//		

		response.setContentType("application/json;charset=UTF-8");
		
//		toJson은 Json의 객체로 문자열로 만들어준다.
//		System.out.println(new Gson().toJson(findUser));

//		fromJson은 자바 객체로 만들어준다.
//		System.out.println(new Gson().fromJson("{\"no\":1,\"name\":\"이정훈\",\"age\":20,\"gender\":\"남자\"}", User.class));
		
		
//		response.getWriter().write("{\"no\": 1, \"name\":\"이정훈\"}");
		
//		response.getWriter().printf("{\"no\": %d, \"name\":\"%s\"}", findUser.getNo(), findUser.getName());
		
//		response.getWriter().println(findUser.toString());
		
		new Gson().toJson(findUser, response.getWriter());
		
//		response.getWriter().write(new Gson().toJson(findUser));
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 정보가 저장되어 있는 List 객체 생성
		List<User> list = new ArrayList<>();
				
		list.add(new User(1,"이정훈",20,"남자"));
		list.add(new User(2,"김철수",16,"남자"));
		list.add(new User(3,"김영희",16,"여자"));
		list.add(new User(4,"홍길동",20,"남자"));
		list.add(new User(5,"영심이",15,"여자"));
		list.add(new User(6,"왕경태",15,"남자"));
		
		String gender = request.getParameter("gender");
		
//		System.out.println(gender);
		
		List<User> findUsers = list.stream().
											filter(user->user.getGender().equals(gender)).
											collect(Collectors.toList());
		
		System.out.println(findUsers);
		
		System.out.println(new Gson().toJson(findUsers));
		
//		자바스크립트 배열처럼 만들어준다.
//		[{"no":3,"name":"김영희","age":16,"gender":"여자"},{"no":5,"name":"영심이","age":15,"gender":"여자"}]
		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(findUsers,response.getWriter());
		
	}

}
