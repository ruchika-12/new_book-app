<%@page import="dto.Book, dao.BookD"%>
<jsp:useBean id="u" class="dto.Book"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
BookD.delete(u);
response.sendRedirect("viewbooks.jsp");
%>