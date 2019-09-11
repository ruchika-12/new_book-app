<%@page import="dao.BookD"%>
<jsp:useBean id="u" class="dto.Book"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=BookD.update(u);
response.sendRedirect("viewbooks.jsp");
%>