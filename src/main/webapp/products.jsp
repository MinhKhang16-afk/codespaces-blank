<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trường Cao đẳng Kinh tế Thành phố Hồ Chí Minh - HCE</title>
    <style>
        body { 
            font-family: Arial, Helvetica, sans-serif; 
            margin: 0; padding: 0 0 50px 0; background-color: #f1f3f7; color: #333333;
            display: flex; flex-direction: column; align-items: center;
        }
        .container { width: 100%; max-width: 1100px; margin-top: 40px; padding: 0 20px; box-sizing: border-box; }
        
        /* Khối Card Trắng Bo Góc chứa bảng */
        .content-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 40px 45px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        
        .content-card h2 {
            font-size: 26px;
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: bold;
        }
        
        /* Thanh Tìm Kiếm Chính Giữa Trang */
        .search-form {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 30px;
        }
        .search-input {
            width: 320px;
            padding: 10px 14px;
            border: 1px solid #cccccc;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            color: #555555;
        }
        .btn-search {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 24px;
            font-size: 14px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: normal;
        }
        .btn-search:hover { background-color: #2980b9; }
        .btn-clear {
            background-color: #e74c3c;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            font-size: 14px;
            border-radius: 6px;
            font-weight: normal;
            display: inline-flex;
            align-items: center;
        }
        .btn-clear:hover { background-color: #c0392b; }

        /* Bảng danh sách sản phẩm chuẩn hóa tỉ lệ */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 15px 20px;
            font-size: 14px;
            border-bottom: 1px solid #edf2f7;
            vertical-align: middle;
        }
        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        
        /* Bo góc nhẹ cho 2 đầu thanh tiêu đề xanh */
        th:first-child { border-top-left-radius: 6px; border-bottom-left-radius: 6px; width: 12%; }
        th:nth-child(2) { width: 48%; }
        th:nth-child(3) { width: 20%; }
        th:last-child { border-top-right-radius: 6px; border-bottom-right-radius: 6px; width: 20%; }
        
        /* Căn chỉnh text trong hàng dữ liệu đúng từng cột */
        td:first-child { text-align: center; color: #333333; }
        td:nth-child(2) { text-align: center; color: #333333; }
        td:nth-child(3) { text-align: center; color: #e53e3e; font-weight: bold; }
        td:last-child { text-align: center; color: #333333; }
        
        tr:hover td { background-color: #f8fafc; }
    </style>
</head>
<body>

    <div style="background-color: #ffffff; width: 100%; font-family: Arial, sans-serif; border-bottom: 1px solid #e5e5e5; color: #333333;">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 15px 20px; box-sizing: border-box;">
            
            <div style="display: flex; gap: 20px; font-size: 11.5px; font-weight: bold; letter-spacing: 0.3px;">
                <a href="doikm.jsp" style="color: #b4191f; text-decoration: none;">TRANG CHỦ</a>
                <a href="#" style="color: #777777; text-decoration: none;">EGOV</a>
                <a href="#" style="color: #777777; text-decoration: none;">SINH VIÊN</a>
            </div>
            
            <div style="display: flex; align-items: center; max-width: 550px;">
                <img src="${pageContext.request.contextPath}/images/Ten-truong-do-1000x159.png" 
                     alt="Trường Cao đẳng Kinh tế Thành phố Hồ Chí Minh" 
                     style="width: 100%; height: auto; max-height: 60px; object-fit: contain;">
            </div>

            <div style="display: flex; align-items: center; padding-bottom: 4px;">
                <a href="${pageContext.request.contextPath}/chuyendoi" 
                   style="color: #b4191f; text-decoration: none; font-size: 12px; font-weight: bold; border: 1px solid #b4191f; padding: 6px 12px; border-radius: 4px; background-color: #fff5f5; display: inline-flex; align-items: center; gap: 4px;">
                    🛠️ CÔNG CỤ TIỆN ÍCH
                </a>
            </div>
        </div>

        <div style="background-color: #b4191f; width: 100%;">
            <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: center; gap: 40px; padding: 14px 20px; font-size: 13.5px; font-weight: bold; color: #ffffff; box-sizing: border-box; text-transform: uppercase;">
                <div style="cursor: pointer;">GIỚI THIỆU ▾</div>
                <div style="cursor: pointer;">TIN TỨC - SỰ KIỆN</div>
                <div style="cursor: pointer;">TUYỂN SINH ▾</div>
                <div style="cursor: pointer;">CÔNG KHAI GIÁO DỤC ▾</div>
                <div style="cursor: pointer;">CƠ CẤU TỔ CHỨC ▾</div>
                <div style="cursor: pointer;">LIÊN KẾT ▾</div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="content-card">
            <h2>Northwind Products</h2>

            <form action="${pageContext.request.contextPath}/timsanpham" method="GET" class="search-form">
                <input type="text" name="q" class="search-input" 
                       placeholder="Nhập tên sản phẩm..." 
                       value="<%= request.getParameter("q") != null ? request.getParameter("q") : "" %>" />
                <button type="submit" class="btn-search">Tìm kiếm</button>
                
                <% if (request.getParameter("q") != null && !request.getParameter("q").toString().trim().isEmpty()) { %>
                    <a href="${pageContext.request.contextPath}/timsanpham" class="btn-clear">Hủy lọc</a>
                <% } %>
            </form>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Tôn kho</th>
                    </tr>
                </thead>
                <tbody>
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
                        <td colspan="4" style="text-align:center; color: #e53e3e; padding: 30px; font-weight: bold;">
                            ⚠️ Không tìm thấy thực thể sản phẩm nào tương thích trong hệ thống!
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>