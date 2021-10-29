<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>답변 글 작성</h1>
	
	<form action="qaanswer.do" method="post">
		<input type="hidden" name="command" value="answerwrite">
		<input type="hidden" name="parentboardno" value="${parent.boardno }">
		<table border = "1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="regId"></td>
			</tr>
			<tr>
				<th>제목</th>											
				<td><input type="text" name="title" value="RE:${parent.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			<tr>
				<td colspan = "2">
					<input type="submit" value="작성">
					<input type="submit" value="취소">
				</td>
			</tr>			
		</table>
		
		
	</form>
</body>
</html>