<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
<style>
table {
  width:100%;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
table#t01 tr:nth-child(even) {
  background-color: #eee;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: black;
  color: white;
}



</style>
</head>
<body background="books1.jpg">

<%@page import="dao.BookD,dto.*,java.util.*"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<h1>Users List</h1>

<%
List<Book> list=BookD.getAllRecords();
request.setAttribute("list",list);
%>

<table id="t01">
<tr>
	<th>Id</th>
	<th>Title</th>
	<th>Auhtor</th>
	<th>Price</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getId()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getAuthor()}</td>
		<td>${u.getPrice()}</td>
		<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
		<td><a href="deletebook.jsp?id=${u.getId()}">Delete</a></td></tr>
</c:forEach>
</table>
<br/><a href="addbookform.jsp">Add New Book</a>

</body>
</html>