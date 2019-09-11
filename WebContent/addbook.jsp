<%@page import="dao.BookD"%>
<jsp:useBean id="book" class="dto.Book"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>

<%
int i=BookD.save(book);
response.sendRedirect("index.jsp");

%>