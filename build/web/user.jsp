<%-- 
    Document   : user.jsp
    Created on : Sep 25, 2024, 4:36:54 PM
    Author     : Windows
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User Page</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null || !"US".equals(loginUser.getRoleID())){
                response.sendRedirect("login.html");
                return;
            }
        %>
        User ID:<%= loginUser.getUserID() %>
        <br>full Name:<%= loginUser.getFullName() %>
        <br>Role ID:<%= loginUser.getRoleID() %>
        <br>Password:<%= "***" %>
    </body>
</html>