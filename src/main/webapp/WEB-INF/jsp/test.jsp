<%@page import="java.util.ArrayList"%>
<%@page import="com.skhu.NWFA.model.testModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		List<testModel> list = new ArrayList<testModel>();
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Stu Name</th>
			<th>Name</th>
			<th>departmentID</th>
			<th>year</th>
		</tr>
		<c:forEach items="${li}" var="dto" varStatus="status">
				<tr>
					<td>${dto.id}</td>
					<td>${dto.studentName}</td>
					<td>${dto.name}</td>
					<td>${dto.departmentId}</td>
					<td>${dto.year}</td>
				<tr>
			</c:forEach>
	</table>

</body>
</html>