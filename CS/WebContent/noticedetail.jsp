<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/common-head.jsp" %>

<style>
	h3 {text-align: center;}
	th {text-align: center;}
	td {text-align: left;}
	
</style>

</head>
<body>
	<br><br>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="noticeanswer.do?command=list">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="faqanswer.do?command=list">FAQ</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="qaanswer.do?command=list">Q&A</a>
	  </li>
	</ul>

	<br><br>
	<h3>공지 상세보기</h3>
	<br><br>
	
	<table border="1" align="center"><col width="10"><col width="200">
		<tr>
			<th>번호</th>
			<td>${dto.noticeSeq }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.regId }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.regDt }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${dto.modDt }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<td colspan="2"><textarea rows="30" cols="100" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:right;">
				<input type="button" value="삭제" onclick="location.href='noticeanswer.do?command=delete&noticeSeq=${dto.noticeSeq}'">
				<input type="button" value="수정" onclick="location.href='noticeanswer.do?command=updateform&noticeSeq=${dto.noticeSeq}'">
				<input type="button" value="목록" onclick="location.href='noticeanswer.do?command=list'">
			</td>
		</tr>
	</table>


</body>
</html>