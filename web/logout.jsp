<%-- 
    Document   : logout
    Created on : 6 May, 2020, 5:56:28 PM
    Author     : meet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logging out</h1>
        <%
            session.removeAttribute("tid");
            session.invalidate();
            response.sendRedirect("index.html");
        %>
    </body>
</html>
