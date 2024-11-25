<%-- 
    Document   : viewCart
    Created on : Oct 12, 2024, 4:06:05 PM
    Author     : Windows
--%>

<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Detail Page</title>
    </head>
    <body>
        <h1>This is your product </h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>price</th>
                    <th>Quantity</th>  
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%                    
                    int count = 1;
                    int grandTotal = 0;  // Tổng tiền của tất cả các sản phẩm
                    for (Product product : cart.getCart().values()) {
                        double total = product.getPrice() * product.getQuantity();  // Tính tổng cho sản phẩm hiện tại
                        grandTotal += total;  // Cộng vào tổng số tiền của giỏ hàng
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getId()%>
                        <input type="hidden" name="id" value="<%= product.getId()%>"/>
                    </td>
                    <td><%= product.getName()%></td>
                    <td><%= product.getPrice()%>$
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" required="" min="1"/>
                    </td>
                    <td><%= product.getQuantity()%></td>
                    <td><%= product.getPrice() * product.getQuantity()%>$</td> 
                    <!--Edit-->
                    <td>
                        <input type="submit" name="action" value="Edit"
                    </td>
                    <!--Remove-->
                    <td>
                        <input type="submit" name="action" value="Remove"
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h1>Total: <%= grandTotal %>$</h1>
    <%
            }
        }
    %>
    <a href="shopping.jsp">Add more!</a>
</body>
</html>
