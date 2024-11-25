<%-- 
    Document   : top1.jsp
    Created on : Oct 10, 2024, 3:40:08 PM
    Author     : Windows
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top1 Page</title>
    </head>
    <body>
        <%
            UserDTO topUser = (UserDTO) session.getAttribute("TOP1");
            if (topUser != null) {
        %>
            <p>User ID: <%= topUser.getUserID() %></p>
            <p>Full Name: <%= topUser.getFullName() %></p>
            <p>Role ID: <%= topUser.getRoleID() %></p>
        <%
            } else {
        %>
            <p>No user found in session.</p>
        <%
            }
        %>
    </body>
</html>
