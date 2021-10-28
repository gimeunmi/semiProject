package com.qa.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qa.biz.QABiz;
import com.qa.dao.QADao;
import com.qa.dto.QADto;

@WebServlet("/qaanswer.do")
public class QAController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		QADao dao = new QADao();
		
		if(command.equals("list")){
			List<QADto> list = dao.selectAll();
			
			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("qalist.jsp");
			disp.forward(request, response);
			
		}else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			QADto dto = dao.selectOne(boardno);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("qadetail.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			response.sendRedirect("qawrite.jsp");
			
		}else if(command.equals("boardwrite")) {
			String regId = request.getParameter("regId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			QADto dto = new QADto();
			dto.setRegId(regId);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.insert(dto);
			if(res>0) {
				dispatch("qaanswer.do?command=list", request, response);
			}else {
				dispatch("qaanswer.do?command=writeform", request, response);
			}
			
		}else if(command.equals("updateform")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			QADto dto = dao.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("qaupdate.jsp", request, response);
			
		}else if(command.equals("boardupdate")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			QADto dto = new QADto();
			dto.setBoardno(boardno);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.update(dto);
			
			if(res>0) {
				dispatch("qaanswer.do?command=list", request, response);
			}else {
				dispatch("qaanswer.do?command=detail&boardno="+boardno, request, response);
			}
			
			
		}else if(command.equals("delete")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			int res = dao.delete(boardno);
			
			//성공 시 목록으로		실패 시 상세페이지로
			if(res>0) {
				dispatch("qaanswer.do?command=list", request, response);
			}else {
				dispatch("qaanswer.do?command=detail&boardno="+boardno, request, response);
			}
			
		}else if(command.equals("answerform")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			QADto dto = dao.selectOne(parentboardno);
			request.setAttribute("parent", dto);
			dispatch("qaanswerwrite.jsp", request, response);
			
		}else if(command.equals("answerwrite")) {
			
			//1 parentboardno에서 필요 정보를 
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			//answerwrite에서 받은 세개의 파라미터값
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String regId = request.getParameter("regId");
			
			//2 이용해서
			QADto parent = dao.selectOne(parentboardno);
			
			int parentgroupno = parent.getGroupno();
			int parentgroupsq = parent.getGroupsq();
			int parenttitletab = parent.getTitletab();
		
			Date regdate = sysdate();
			Date moddate = sysdate();
			
			QADto dto = new QADto(0, parentgroupno, parentgroupsq, parenttitletab,
																	title, content, regId, regdate, moddate, null);
			
			boolean res = new QABiz().answerLogic(dto);
			if(res) {
				response.sendRedirect("qaanswer.do?command=list");
			}else {
				response.sendRedirect("qaanswer.do?command=detail&boardno="+parentboardno);
			}
			
		}
		
		
		
		
		
		
	}
	
	private Date sysdate() {
		// TODO Auto-generated method stub
		return null;
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
