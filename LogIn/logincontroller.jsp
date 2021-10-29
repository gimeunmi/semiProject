<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.prj.dao.MemberDao" %>
<%@ page import="com.prj.dto.MemberDto" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	System.out.println("[command : " + command + "]");
	
	MemberDao dao = new MemberDao();
	
	if(command.equals("login")) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDto dto = dao.login(id, pw);
		
		if(dto.getMyid() != null) {
			session.setAttribute("dto", dto);
			session.setMaxInactiveInterval(60*60);
			
			// 관리자일 경우
			if(dto.getMyrole().equals("ADMIN")) {
				response.sendRedirect("adminmain.jsp");
				// 관리자 메인 페이지로 넘김
			} else if(dto.getMyrole().equals("USER")) {
				response.sendRedirect("usermain.jsp");
				// 유저일 경우에는 유저 메인 페이지로 넘김
			} else if(dto.getMyrole().equals("MANAGER")) {
				response.sendRedirect("usermain.jsp");
			}
		} else {
%>
		<script type="text/javascript">
			alert("login 실패!");
			location.href="index.jsp";
		</script>
<%
		}
		
	} else if(command.equals("userlistall")) {
		List<MemberDto> list = dao.selectAll();
		
		request.setAttribute("list", list);
		pageContext.forward("userlistall.jsp");
		
	} else if(command.equals("userlistenabled")) {
		List<MemberDto> list = dao.selectEnabled();
		request.setAttribute("list", list);
		pageContext.forward("userlistenabled.jsp");
		
	} else if(command.equals("updateroleform")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		MemberDto dto = dao.selectUser(myno);
		
		request.setAttribute("selectone", dto);
		pageContext.forward("updateroleform.jsp");
		
	} else if(command.equals("updaterole")) {						// 회원등급 조정
		int myno = Integer.parseInt(request.getParameter("myno"));
		String myrole = request.getParameter("myrole");
		
		int res = dao.updateRole(myno, myrole);
		
		if(res > 0) {	// 성공했다면~
%>
		 <script type="text/javascript">
		 	alert("회원 등급 조정 성공");
		 	location.href="logincontroller.jsp?command=userlistenabled";
		 </script>
<%
		} else {
%>
		 <script type="text/javascript">
		 	alert("회원 등급 조정 실패");
		 	location.href="logincontroller.jsp?command=updateroleform&myno=<%=myno%>";
		 </script>
<%
		}
	} else if(command.equals("logout")) {
		// session 정보 삭제
		session.invalidate();
		response.sendRedirect("index.jsp");
		
	} else if(command.equals("registform")) {
		response.sendRedirect("registform.jsp");
		
	} else if(command.equals("idchk")) {
		String myid = request.getParameter("id");
		String res = dao.idChk(myid);
		
		boolean idnotused = true;
		
		if(res != null) {	// id가 중복되는 경우
			idnotused = false;
		}
		
		response.sendRedirect("idCheck.jsp?idnotused=" + idnotused);
		
	} else if(command.equals("insertuser")) {
		String myid = request.getParameter("myid");
		String myname = request.getParameter("myname");
		String mypw = request.getParameter("mypw");
		String mypostcode = request.getParameter("mypostcode");
		String myaddr = request.getParameter("myaddr");
		String myadd_addr = request.getParameter("myadd_addr");
		String myphone = request.getParameter("myphone");
		String mygender = request.getParameter("mygender");
		
		MemberDto dto = new MemberDto();
		dto.setMyid(myid);
		dto.setMyname(myname);
		dto.setMypw(mypw);
		dto.setMypostcode(mypostcode);
		dto.setMyaddr(myaddr);
		dto.setMyadd_addr(myadd_addr);
		dto.setMyphone(myphone);
		dto.setMygender(mygender);
		
		int res = dao.insertUser(dto);
		
		if(res > 0) {
%>
		 <script type="text/javascript">
		 	alert("회원가입성공");
		 	location.href="join.jsp";
		 </script>
<%
		} else {
%>
		 <script type="text/javascript">
		 	alert("회원가입실패");
		 	location.href="logincontroller.jsp?command=registform";
		 </script>
<%
		}
		
	} else if(command.equals("userinfo")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		MemberDto dto = dao.selectUser(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("userinfo.jsp");
		
	} else if(command.equals("updateform")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		MemberDto dto = dao.selectUser(myno);
		
		request.setAttribute("dto", dto);
		pageContext.forward("updateuser.jsp");
		
	} else if(command.equals("updateuser")) {
		String myaddr = request.getParameter("myaddr");
		String myemail = request.getParameter("myemail");
		String myphone = request.getParameter("myphone");
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		MemberDto dto = new MemberDto();
		dto.setMyaddr(myaddr);
		dto.setMyphone(myphone);
		dto.setMyno(myno);
		
		boolean res = dao.updateUser(dto);
		
		if(res) {
%>
		 <script type="text/javascript">
		 	alert("수정 성공!");
		 	location.href="logincontroller.jsp?command=userinfo&myno=<%=myno%>";
		 </script>
<%
		} else {
%>
		 <script type="text/javascript">
		 	alert("수정 실패ㅠ");
		 	location.href="logincontroller.jsp?command=userinfo&myno=<%=myno%>";
		 </script>
<%
		}
		
	} else if(command.equals("deleteuser")) {
		int myno = Integer.parseInt(request.getParameter("myno"));
		boolean res = dao.deleteUser(myno);
		
		// 탈퇴 => 삭제X, MYENABLED ==> 'N'으로 변경
		if(res) {
%>
		 <script type="text/javascript">
		 	alert("탈퇴 성공");
		 	location.href="logincontroller.jsp?command=logout";
		 </script>
<%
		} else {
%>
		 <script type="text/javascript">
		 	alert("탈퇴 실패");
		 	location.href="logincontroller.jsp?command=userinfo&myno=<%=myno%>";
		 </script>
<%
		}
				
	}
%>
</body>
</html>