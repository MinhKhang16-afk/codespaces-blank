<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Northwind Cyber System</title>
    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 0; padding: 30px; 
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%); 
            color: #e2e8f0; min-height: 100vh;
        }
        h2 { 
            color: #00f5ff; text-transform: uppercase; letter-spacing: 2px;
            text-shadow: 0 0 10px rgba(0,245,255,0.5); margin-top: 0;
        }
        .btn { 
            display: inline-block; text-decoration: none; padding: 10px 20px; 
            background: linear-gradient(90deg, #3b82f6, #8b5cf6); color: white; 
            border-radius: 6px; font-weight: 600; border: none; cursor: pointer;
            transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(139, 92, 246, 0.4);
        }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(139, 92, 246, 0.6); }
        
        .search-container { 
            margin: 25px 0; background: rgba(255, 255, 255, 0.03); 
            padding: 20px; border-radius: 12px; 
            border: 1px solid rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px);
        }
        .search-input { 
            padding: 12px 16px; width: 320px; 
            background: rgba(0, 0, 0, 0.4); border: 1px solid #475569; 
            border-radius: 8px; font-size: 14px; color: white; outline: none;
            transition: all 0.3s;
        }
        .search-input:focus { border-color: #00f5ff; box-shadow: 0 0 10px rgba(0,245,255,0.3); }
        .btn-search { background: #00f5ff; color: #0f172a; font-weight: bold; margin-left: 8px; }
        .btn-search:hover { background: #33f7ff; box-shadow: 0 0 15px rgba(0,245,255,0.5); }
        .btn-clear { background: #f43f5e; color: white; margin-left: 5px; box-shadow: 0 4px 10px rgba(244,63,94,0.3); }
        .btn-clear:hover { background: #fb7185; box-shadow: 0 0 15px rgba(244,63,94,0.5); }
        
        table { 
            width: 100%; border-collapse: separate; border-spacing: 0;
            margin-top: 20px; background: rgba(30, 41, 59, 0.7); 
            border-radius: 12px; overflow: hidden; border: 1px solid rgba(255,255,255,0.05);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        th, td { padding: 14px 20px; text-align: left; border-bottom: 1px solid rgba(255,255,255,0.05); }
        th { 
            background: linear-gradient(90deg, #1e1b4b, #312e81); 
            color: #00f5ff; font-weight: 600; text-transform: uppercase; font-size: 13px; letter-spacing: 1px;
        }
        tr:last-child td { border-bottom: none; }
        tr:nth-child(even) { background-color: rgba(255, 255, 255, 0.02); }
        tr:hover { background-color: rgba(255, 255, 255, 0.06); transition: background 0.2s; }
        td { font-size: 15px; color: #cbd5e1; }
        td:nth-child(3) { color: #10b981; font-weight: bold; } /* Đổi màu cột Giá */
    </style>
</head>
<body>

    <h2>✦ Northwind Cyber Intelligence ✦</h2>
    <div style="margin-bottom: 15px;">
        <a href="chuyenDoi.jsp" class="btn">⏪ Back to Terminal Console</a>
    </div>

    <div class="search-container">
        <form action="products" method="GET">
            <input type="text" name="searchKeyword" class="search-input" 
                   placeholder="Nhập tên sản phẩm cần quét mã..." 
                   value="<%= request.getAttribute("searchValue") != null ? request.getAttribute("searchValue") : "" %>" />
            <button type="submit" class="btn btn-search">Quét dữ liệu 🔍</button>
            <a href="products" class="btn btn-clear">Hủy bộ lọc ❌</a>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>System ID</th>
                <th>Product Core Name</th>
                <th>Database Unit Price</th>
                <th>Stock Availability</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                if (listProduct != null && !listProduct.isEmpty()) {
                    for (Product p : listProduct) {
            %>
            <tr>
                <td style="color: #8b5cf6; font-weight: bold;">#<%= p.getProductID() %></td>
                <td><%= p.getProductName() %></td>
                <td>$<%= p.getUnitPrice() %></td>
                <td>
                    <span style="<%= p.getUnitsInStock() == 0 ? "color: #ef4444;" : "" %>">
                        <%= p.getUnitsInStock() %> đơn vị
                    </span>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="4" style="text-align:center; color: #f43f5e; padding: 30px; font-weight: bold;">
                    ⚠️ Không tìm thấy thực thể sản phẩm nào tương thích!
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>