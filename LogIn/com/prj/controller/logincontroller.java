package com.prj.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.prj.dao.loginDao;
import com.prj.dto.loginDto;


@WebServlet("/logincontroller.do")
public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		loginDao dao = new loginDao();
		
		if(command.equals("loginform")) {
			response.sendRedirect("login.jsp");

		}else if(command.equals("main")) {
			response.sendRedirect("main.jsp");
		}
		
		else if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			HttpSession session =request.getSession();
			
			loginDto dto = dao.login(id,pw);
			
			if(dto.getMyid()!=null){
				System.out.println("login");
				session.setAttribute("dto",dto);
				RequestDispatcher disp = request.getRequestDispatcher("main.jsp");
				disp.forward(request,response);

			}else {
				
				jsResponse("로그인 실패","controller.do?command=loginform",response);
			}
			
		}else if(command.equals("joinform")) {
			response.sendRedirect("join.jsp");
		}else if(command.equals("kakao")) {
			String email= request.getParameter("email");
			String gender = request.getParameter("gender");
			String type = "kakao";
			
			//db에 담아서 저장 , session에 담아 main으로 전송해야함
		}else if(command.equals("logout")) {
			HttpSession session =request.getSession();
			
			session.invalidate();
			response.sendRedirect("main.jsp");
		}
	
	}
	




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void jsResponse(String msg,String url,HttpServletResponse response) throws IOException{
		String s="<script type='text/javascript'>"+
				"alert('"+msg+"');"+
				"location.href='"+url+"';"+
				"</script>";
			PrintWriter out = response.getWriter();
		out.print(s);
				
		
	}
	

	

}
