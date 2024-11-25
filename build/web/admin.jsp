<%-- 
    Document   : admin.jsp
    Created on : Sep 25, 2024, 4:36:47 PM
    Author     : Windows
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <form action="MainController" method="POST">
           <input type="submit" name="action" value="Logout"/>  
        </form>
        
        <form action="MainController">
            Search: <input type="text" name="search" value="<%= search%>" />
            <input type="submit" name="action" value="Search" />
        </form>
            
        <form action="MainController" method="POST">
           <input type="submit" name="action" value="Top1"/>  
        </form>
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null && listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="userID" value="<%= user.getUserID()%>" readonly="" />
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required="" />
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required="" />
                    </td>
                    <td><%= user.getPassword()%></td>
                    <!--Update here-->
                    <td>
                        <input type="submit" name="action" value="Update" />
                        <input type="hidden" name="search" value="<%= search%>" />
                    </td>
                    <!--Delete here-->
                    <td>
                        <a href="MainController?action=Delete&userID=<%= user.getUserID()%>&search=<%= search%>">Delete</a>
                    </td>
                </tr>
            </form>

            <%
                }
            %>
        </tbody>
    </table>


    <%
        }
    %>
    <%
        String errorMsg = (String) request.getAttribute("ERROR");
        if (errorMsg != null) {
    %>
    <%= errorMsg%>
    <%
        }
    %>
</body>
</html>
