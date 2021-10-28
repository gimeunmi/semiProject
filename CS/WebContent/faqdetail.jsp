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
	<h3>FAQ 상세보기</h3>
	<br><br>
	
	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<td>${dto.faqSeq }</td>
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
			<th>질문</th>
			<td colspan="2"><textarea rows="10" cols="100" readonly="readonly">${dto.title }</textarea></td>
		</tr>
		<tr>
			<th>답변</th>
			<td colspan="2"><textarea rows="10" cols="100" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:right;">
				<input type="button" value="삭제" onclick="location.href='faqanswer.do?command=delete&faqSeq=${dto.faqSeq}'">
				<input type="button" value="수정" onclick="location.href='faqanswer.do?command=updateform&faqSeq=${dto.faqSeq}'">
				<input type="button" value="목록" onclick="location.href='faqanswer.do?command=list'">
			</td>
		</tr>
	</table>

</body>
</html>