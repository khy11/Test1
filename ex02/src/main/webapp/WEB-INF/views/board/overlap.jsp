<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 데이터에 있는 값 빼오기(modle.attribute)) --%>
<c:forEach items="${overlap}" var = "temp">
작성자 : ${temp.writer} 제목 :${temp.title} 글 개수 : ${temp.cn} <br> <%--db에서 가져와서 attribute에 들어간 데이터 값 하나씩 가져오기  --%> 
</c:forEach>


<button type ="button" onclick="lacation.href='/board/list?pageNum=${criteria.pageNum}&amount=${criteria.amount}'">목록보기</button>
</body>
</html>