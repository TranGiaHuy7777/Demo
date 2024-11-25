<%-- 
    Document   : shopping
    Created on : Oct 12, 2024, 3:27:42 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookStore Page</title>
    </head>
    <body>
        <h1>Welcome to BookStore</h1>
        <form action="MainController">
            Name:<select name="toyList">
                <option value="B001-Clean Code-10">Book1-10$</option>
                <option value="B002-Thinking in Java-50">Book2-50$</option>
                <option value="B003-Design Patterns-40">Book3-40$</option>
                <option value="B004-The Pragmatic Programmer-60">Book4-60$</option>
                <option value="B005-Refactoring-60">Book4-60$</option>
            </select>
            Quantity:
            <select name="quantity">
                <option value="1">1 item</option>
                <option value="2">2 items</option>
                <option value="3">3 items</option>
                <option value="4">4 items</option>
                <option value="5">5 items</option>
                <option value="10">10 items</option>
                <option value="20">20 items</option>
            </select>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="viewCart"/>
        </form>
        <%
             String message = (String) request.getAttribute("MESSAGE");
             if(message==null) message="";
        %>
        <%= message %>
    </body>
</html>
