<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>

</head>
<body background="books1.jpg">
<%@page import="dao.BookD,dto.Book"%>

<%
String id=request.getParameter("id");
Book u=BookD.getRecordById(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editbook.jsp" method="post">
<input type="hidden" name="id" value="<%=u.getId() %>"/>
<table>
<tr><td>Title</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
<tr><td>Author</td><td><input type="text" name="author" value="<%= u.getAuthor()%>"/></td></tr>
<tr><td>Price</td><td><input type="text" name="price" value="<%= u.getPrice()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Book"/></td></tr>
</table>
</form>

</body>
</html>