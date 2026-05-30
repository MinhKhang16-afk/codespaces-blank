<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even){background-color: #f2f2f2;}
        .btn { display: inline-block; margin-bottom: 15px; text-decoration: none; padding: 8px 12px; background: #2196F3; color: white; border-radius: 4px; }
    </style>
</head>
<body>

    <h2>Northwind Products List</h2>
    <a href="chuyenDoi.jsp" class="btn">⏪ Quay lại trang Chuyển đổi nhiệt độ</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Stock</th>
        </tr>
        <%
            List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
            if (listProduct != null && !listProduct.isEmpty()) {
                for (Product p : listProduct) {
        %>
        <tr>
            <td><%= p.getProductID() %></td>
            <td><%= p.getProductName() %></td>
            <td>$<%= p.getUnitPrice() %></td>
            <td><%= p.getUnitsInStock() %></td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="4" style="text-align:center; color: red; padding: 20px; font-weight: bold;">
                ⚠️ Không tìm thấy dữ liệu! Hãy chắc chắn rằng bạn đã kích hoạt chạy lệnh nạp SQL ở Bước 1.
            </td>
        </tr>
        <% } %>
    </table>

</body>
</html>