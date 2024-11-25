<%-- 
    Document   : login
    Created on : Sep 25, 2024, 4:50:09 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="MainController" method="POST">
            User ID: <input type="text"  name="userID"></br>
            Password: <input type="password"  name="password"/></br>
            <input type="submit" value="Login" name="action"/>
            <input type="reset" value="Reset"/>
            
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if(error == null) error = "";
            
        %>
        <%= error %>
    </body>
</html>
