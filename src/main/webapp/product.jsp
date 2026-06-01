<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HCE - Kho Hàng Northwind Intelligence</title>
    <style>
        body { 
            font-family: Arial, Helvetica, sans-serif; 
            margin: 0; padding: 0 0 40px 0; 
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%); 
            color: #e2e8f0; min-height: 100vh;
            display: flex; flex-direction: column; align-items: center;
        }
        .main-wrapper { width: 100%; max-width: 1200px; padding: 0 20px; box-sizing: border-box; margin-top: 25px; }
        
        .btn { 
            display: inline-block; text-decoration: none; padding: 10px 20px; 
            background: linear-gradient(90deg, #3b82f6, #8b5cf6); color: white; 
            border-radius: 6px; font-weight: bold; border: none; cursor: pointer;
            transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(139, 92, 246, 0.4);
        }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(139, 92, 246, 0.6); }
        
        .search-container { 
            margin: 20px 0; background: rgba(255, 255, 255, 0.03); 
            padding: 20px; border-radius: 12px; 
            border: 1px solid rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px);
        }
        .search-input { 
            padding: 12px 16px; width: 320px; 
            background: rgba(0, 0, 0, 0.4); border: 1px solid #475569; 
            border-radius: 8px; font-size: 14px; color: white; outline: none;
        }
        .btn-search { background: #00f5ff; color: #0f172a; font-weight: bold; margin-left: 8px; box-shadow: none; }
        .btn-search:hover { background: #33f7ff; box-shadow: 0 0 15px rgba(0,245,255,0.5); }
        .btn-clear { background: #f43f5e; color: white; margin-left: 5px; }
        
        table { 
            width: 100%; border-collapse: separate; border-spacing: 0;
            margin-top: 15px; background: rgba(30, 41, 59, 0.7); 
            border-radius: 12px; overflow: hidden; border: 1px solid rgba(255,255,255,0.05);
        }
        th, td { padding: 14px 20px; text-align: left; border-bottom: 1px solid rgba(255,255,255,0.05); }
        th { 
            background: linear-gradient(90deg, #1e1b4b, #312e81); 
            color: #00f5ff; font-weight: 600; text-transform: uppercase; font-size: 13px; letter-spacing: 1px;
        }
        tr:last-child td { border-bottom: none; }
        tr:nth-child(even) { background-color: rgba(255, 255, 255, 0.02); }
        td { font-size: 15px; color: #cbd5e1; }
        td:nth-child(3) { color: #10b981; font-weight: bold; }
    </style>
</head>
<body>

    <div style="background-color: #ffffff; width: 100%; border-bottom: 1px solid #e2e8f0; font-family: Arial, sans-serif; color: #1e293b;">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 25px 20px 20px 20px; box-sizing: border-box;">
            
            <div style="display: flex; gap: 15px; font-size: 12px; font-weight: bold;">
                <a href="chuyenDoi.jsp" style="color: #4b5563; text-decoration: none; padding: 6px 12px; border: 1px solid #cbd5e1; border-radius: 4px; background: #f8fafc;">⬅ QUAY LẠI</a>
            </div>
            
            <div style="display: flex; align-items: center; gap: 15px; margin-left: -70px;">
                <svg width="60" height="60" viewBox="0 0 100 110" style="flex-shrink: 0;">
                    <path d="M50 5 L88 30 L88 75 L50 105 L12 75 L12 30 Z" fill="none" stroke="#a22126" stroke-width="4"/>
                    <path d="M50 12 L82 35 L82 70 L50 96 L18 70 L18 35 Z" fill="none" stroke="#a22126" stroke-width="1.5"/>
                    <path d="M36 78 C34 72 35 64 39 56 C42 48 48 40 50 30 C52 40 58 48 61 56 C65 64 66 72 64 78 C60 84 50 86 50 86 C50 86 40 84 36 78 Z" fill="#a22126"/>
                    <path d="M43 76 C41 72 42 66 45 61 C48 56 50 50 50 44 C50 50 52 56 55 61 C58 66 59 72 57 76 C55 80 50 81 50 81 C50 81 45 80 43 76 Z" fill="#ffffff"/>
                    <text x="50" y="100" font-family="Arial" font-size="11" font-weight="900" fill="#a22126" text-anchor="middle" letter-spacing="1">HCE</text>
                </svg>
                <div style="text-align: left;">
                    <div style="margin: 0; font-size: 21px; color: #a22126; font-weight: bold; letter-spacing: -0.2px;">TRƯỜNG CAO ĐẲNG KINH TẾ THÀNH PHỐ HỒ CHÍ MINH</div>
                    <div style="margin: 4px 0 0 0; font-size: 13.5px; color: #333333; font-weight: bold; letter-spacing: 0.4px;">HO CHI MINH CITY COLLEGE OF ECONOMICS</div>
                </div>
            </div>

            <div style="display: flex; align-items: center; border-bottom: 1px solid #cccccc; padding-bottom: 6px; width: 220px;">
                <input type="text" placeholder="Tìm kiếm nhanh..." style="border: none; outline: none; font-size: 14px; width: 100%; color: #444444; background: transparent;">
                <span style="color: #a22126; font-size: 16px; font-weight: bold;">🔍</span>
            </div>
        </div>

        <div style="background-color: #a22126; width: 100%;">
            <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: center; gap: 40px; padding: 14px 20px; font-size: 14px; font-weight: bold; color: #ffffff; box-sizing: border-box; text-transform: uppercase;">
                <a href="chuyenDoi.jsp" style="color: #ffffff; text-decoration: none;">GIỚI THIỆU ▾</a>
                <div style="color: #fde047;">HỆ THỐNG QUẢN LÝ CƠ SỞ DỮ LIỆU NORTHWIND 🌟</div>
                <div style="cursor: pointer;">LIÊN KẾT GIÁO DỤC ▾</div>
            </div>
        </div>
    </div>

    <div class="main-wrapper">
        <div style="margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center;">
            <h3 style="color: #00f5ff; text-transform: uppercase; letter-spacing: 2px; margin: 0;">✦ Northwind Cyber Intelligence Console ✦</h3>
        </div>

        <div class="search-container">
            <form action="timkiemsanpham" method="GET">
                <input type="text" name="searchKeyword" class="search-input" 
                       placeholder="Nhập tên sản phẩm cần quét mã..." 
                       value="<%= request.getAttribute("searchValue") != null ? request.getAttribute("searchValue") : "" %>" />
                <button type="submit" class="btn btn-search">Quét dữ liệu 🔍</button>
                <a href="timkiemsanpham" class="btn btn-clear">Hủy bộ lọc ❌</a>
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
    </div>

</body>
</html>