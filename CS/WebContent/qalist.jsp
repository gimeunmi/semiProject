<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/common-head.jsp" %>

<style>
	h3 {text-align: center;}
	th {text-align: center;}
	td {text-align: center;}
	div {
		position: absolute;
		top:500px;
		left:1050px;
	}
</style>

</head>
<body>
	<br><br>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link" href="noticeanswer.do?command=list">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="faqanswer.do?command=list">FAQ</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="qaanswer.do?command=list">Q&A</a>
	  </li>
	</ul>
	
	<br><br>
	<h3>Q&A</h3>
	<br><br>

	<table border="1" align="center">
		<col width="50"><col width="500"><col width="150"><col width="100"><col width="100">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5" align="center">작성 된 글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.boardno }</td>
						<td>
							<c:forEach begin="1" end="${dto.titletab }">
								&nbsp;&nbsp;
							</c:forEach>
							<a href="qaanswer.do?command=detail&boardno=${dto.boardno }">${dto.title }</a>
						</td>
						<td>${dto.regId }</td>
						<td>${dto.regdate }</td>
						<td>${dto.moddate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<tr>
				<td colspan="5" style="text-align:right;">
				<input type="button" value="글쓰기" onclick="location.href='qaanswer.do?command=writeform'">
				</td>
			</tr>
		</table>
			
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">4</a></li>
			    <li class="page-item"><a class="page-link" href="#">5</a></li>
			    <li class="page-item"><a class="page-link" href="#">6</a></li>
			    <li class="page-item"><a class="page-link" href="#">7</a></li>
			    <li class="page-item"><a class="page-link" href="#">8</a></li>
			    <li class="page-item"><a class="page-link" href="#">9</a></li>
			    <li class="page-item"><a class="page-link" href="#">10</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
			
			
</body>
</html>