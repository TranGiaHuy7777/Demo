<%-- 
    Document   : createUser
    Created on : Oct 9, 2024, 3:06:24 PM
    Author     : Windows
--%>


<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if(userError==null) {
               userError = new UserError(); 
            }
        %>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/><%= userError.getUserIDError() %>
            </br>Full Name<input type="text" name="fullName" required=""/><%= userError.getFullNameError() %>
            </br>Role ID<input type="text" name="roleID" value="US" readonly=""/>
            </br>Password<input type="password" name="password" required=""/>
            </br>Confirm<input type="password" name="confirm" required=""/><%= userError.getConfirmError() %>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
            <%= userError.getError() %>
        </form>
        
        <form action="MainController" method="POST">
           <input type="submit" name="action" value="Logout"/>  
        </form>
    </body>
</html>
