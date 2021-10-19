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

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

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
		
		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			loginDto dto = dao.login(id,pw);
			System.out.println(dto.getMyid());
			if(dto.getMyid()!=null){
				HttpSession session =request.getSession();
				session.setAttribute("dto",dto);
				System.out.println("login");
				RequestDispatcher disp = request.getRequestDispatcher("adminmain.jsp");
				disp.forward(request,response);
			
		
				
				if(dto.getMyrole().equals("ADMIN")){
					System.out.println("admin login");
					
				
				}else if(dto.getMyrole().equals("USER")){
					response.sendRedirect("usermsain.jsp");
				}else if(dto.getMyrole().equals("MANAGER")){
					response.sendRedirect("usermain.jsp");
				}
			}else {
				
				jsResponse("로그인 실패","controller.do?command=list",response);
			}
			
		}else if(command.equals("joinform")) {
			response.sendRedirect("join.jsp");
		}else if(command.equals("join")) {
			
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
	
	protected void service(HttpServletRequest request,  HttpServletResponse response) throws ServletException,  IOException {
	    HttpSession session = request.getSession();
	}

}
