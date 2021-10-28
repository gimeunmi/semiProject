package com.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.dao.NoticeDao;
import com.notice.dto.NoticeDto;

@WebServlet("/noticeanswer.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		NoticeDao dao = new NoticeDao();
		
		if(command.equals("list")){
			List<NoticeDto> list = dao.selectAll();
			System.out.println(list.size());
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getTitle());
			}
			
			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("noticelist.jsp");
			disp.forward(request, response);
			
		}else if(command.equals("detail")) {
			int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
			
			NoticeDto dto = dao.selectOne(noticeSeq);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("noticedetail.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("noticewrite.jsp");
			
		}else if(command.equals("boardwrite")) {
			String regId = request.getParameter("regId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			NoticeDto dto = new NoticeDto();
			dto.setRegId(regId);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.insert(dto);
			if(res>0) {
				dispatch("noticeanswer.do?command=list", request, response);
			}else {
				dispatch("noticeanswer.do?command=writeform", request, response);
			}
			
		}else if(command.equals("updateform")) {
			int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
			
			NoticeDto dto = dao.selectOne(noticeSeq);
			request.setAttribute("dto", dto);
			dispatch("noticeupdate.jsp", request, response);
			
		}else if(command.equals("boardupdate")) {
			int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoticeDto dto = new NoticeDto();
			dto.setNoticeSeq(noticeSeq);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.update(dto);
			
			if(res>0) {
				dispatch("noticeanswer.do?command=list", request, response);
			}else {
				dispatch("noticeanswer.do?command=detail&noticeSeq="+noticeSeq, request, response);
			}
			
		}else if(command.equals("delete")) {
			int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
			
			int res = dao.delete(noticeSeq);
			
			//성공 시 목록으로		실패 시 상세페이지로
			if(res>0) {
				dispatch("noticeanswer.do?command=list", request, response);
			}else {
				dispatch("noticeanswer.do?command=detail&noticeSeq="+noticeSeq, request, response);
			}
			
		}
		
		
		
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

