<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<html>
<head>
    <title>Danh Sách Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 50%; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>TÌM KIẾM SẢN PHẨM (NÂNG CAO)</h2>
    <form action="<%= request.getContextPath() %>/san-pham" method="get">
        Nhập tên sản phẩm cần tìm: 
        <input type="text" name="searchKeyword" value="<%= request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword") : "" %>">
        <button type="submit">Tìm kiếm</button>
    </form>
    <h3>Danh sách kết quả:</h3>
    <table>
        <tr>
            <th>Mã SP</th>
            <th>Tên Sản Phẩm</th>
            <th>Giá Bán (VND)</th>
        </tr>
        <%
            List<SanPham> listSp = (List<SanPham>) request.getAttribute("dsSanPham");
            if (listSp != null && !listSp.isEmpty()) {
                for (SanPham sp : listSp) {
        %>
                <tr>
                    <td><%= sp.getMaSp() %></td>
                    <td><%= sp.getTenSp() %></td>
                    <td><%= String.format("%,.0f", sp.getGia()) %></td>
                </tr>
        <% 
                }
            } else {
        %>
            <tr>
                <td colspan="3" style="text-align: center; color: red;">Không tìm thấy sản phẩm!</td>
            </tr>
        <% } %>
    </table>
    <br>
    <a href="chuyenDoi.jsp">⏪ Quay lại trang Chuyển Đổi</a>
</body>
</html>
