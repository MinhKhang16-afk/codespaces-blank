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
        .btn { display: inline-block; margin-bottom: 15px; text-decoration: none; padding: 8px 12px; background: #2196F3; color: white; border-radius: 4px; border: none; cursor: pointer;}
        
        /* CSS cho thanh tìm kiếm */
        .search-container { margin-bottom: 20px; background: #f9f9f9; padding: 15px; border-radius: 5px; border: 1px solid #eee; }
        .search-input { padding: 8px 12px; width: 300px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
        .btn-search { background: #4CAF50; padding: 8px 15px; font-size: 14px; }
        .btn-clear { background: #ff9800; padding: 8px 15px; font-size: 14px; text-decoration: none; }
    </style>
</head>
<body>

    <h2>Northwind Products List</h2>
    <div style="margin-bottom: 15px;">
        <a href="chuyenDoi.jsp" class="btn">⏪ Quay lại trang Chuyển đổi nhiệt độ</a>
    </div>

    <div class="search-container">
        <form action="products" method="GET">
            <input type="text" name="searchKeyword" class="search-input" 
                   placeholder="Nhập tên sản phẩm cần tìm..." 
                   value="<%= request.getAttribute("searchValue") != null ? request.getAttribute("searchValue") : "" %>" />
            <button type="submit" class="btn btn-search">Tìm kiếm 🔍</button>
            <a href="products" class="btn btn-clear">Hủy lọc ❌</a>
        </form>
    </div>

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
                ⚠️ Không tìm thấy sản phẩm nào khớp với từ khóa tìm kiếm của bạn!
            </td>
        </tr>
        <% } %>
    </table>

</body>
</html>