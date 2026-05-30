<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Northwind Premium Dashboard</title>
    <style>
        body { 
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; 
            margin: 0; padding: 40px; background-color: #f8fafc; color: #1e293b;
            display: flex; flex-direction: column; align-items: center;
        }
        .container { width: 100%; max-width: 800px; }
        h1 { font-size: 28px; font-weight: 700; color: #0f172a; margin-top: 0; margin-bottom: 30px; letter-spacing: -0.5px; text-align: center; }
        
        /* CSS cho các thẻ chức năng (Card) */
        .card { 
            background: white; padding: 24px; border-radius: 12px; border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02), 0 4px 12px rgba(0,0,0,0.03);
            margin-bottom: 20px; transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover { transform: translateY(-2px); box-shadow: 0 6px 16px rgba(0,0,0,0.05); }
        .card h3 { margin-top: 0; margin-bottom: 15px; color: #0f172a; font-size: 16px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; display: flex; align-items: center; gap: 8px;}
        
        /* Giao diện form nhập liệu */
        .form-group { display: flex; gap: 12px; align-items: center; flex-wrap: wrap; }
        label { font-size: 14px; color: #475569; font-weight: 500; }
        .form-input, select { 
            padding: 10px 16px; border: 1px solid #cbd5e1; border-radius: 8px; 
            font-size: 14px; outline: none; transition: border-color 0.2s; min-width: 180px; background: white;
        }
        .form-input:focus, select:focus { border-color: #4f46e5; }
        
        /* Nút bấm Premium */
        .btn { 
            display: inline-block; text-decoration: none; padding: 10px 20px; 
            background-color: #4f46e5; color: white; border-radius: 8px; 
            font-size: 14px; font-weight: 500; border: none; cursor: pointer; transition: all 0.2s;
        }
        .btn:hover { background-color: #4338ca; }
        .btn-secondary { background-color: #0f172a; }
        .btn-secondary:hover { background-color: #334155; }
        
        /* Vùng hiển thị kết quả */
        .result-box { margin-left: auto; font-size: 15px; font-weight: 600; color: #059669; background: #e6f4ea; padding: 8px 16px; border-radius: 6px; }
        
        /* Nút chuyển hướng lớn ở dưới */
        .footer-action { text-align: center; margin-top: 25px; }
    </style>
</head>
<body>

    <div class="container">
        <h1>BÀI GIỮA KỲ: HỆ THỐNG ĐIỀU HƯỚNG & CHUYỂN ĐỔI</h1>

        <div class="card">
            <h3>🌡️ 1. Chuyển đổi Độ C sang Độ F</h3>
            <form action="convert" method="POST" class="form-group">
                <input type="hidden" name="type" value="c2f">
                <label>Nhập độ C:</label>
                <input type="number" step="any" name="celsius" class="form-input" placeholder="Ví dụ: 37" required>
                <button type="submit" class="btn">Chuyển đổi</button>
                
                <% if(request.getAttribute("resultC2F") != null) { %>
                    <div class="result-box">Kết quả: <%= request.getAttribute("resultC2F") %> °F</div>
                <% } %>
            </form>
        </div>

        <div class="card">
            <h3>💵 2. Chuyển đổi USD sang VND</h3>
            <form action="convert" method="POST" class="form-group">
                <input type="hidden" name="type" value="usd2vnd">
                <label>Nhập số tiền (USD):</label>
                <input type="number" step="any" name="usd" class="form-input" placeholder="Ví dụ: 100" required>
                <button type="submit" class="btn">Chuyển đổi</button>
                
                <% if(request.getAttribute("resultUSD") != null) { %>
                    <div class="result-box">Kết quả: <%= request.getAttribute("resultUSD") %> VND</div>
                <% } %>
            </form>
        </div>

        <div class="card">
            <h3>✨ 3. Tra cứu Giá Vàng</h3>
            <form action="gold" method="GET" class="form-group">
                <label>Chọn loại vàng:</label>
                <select name="goldType">
                    <option value="SJC">Vàng SJC</option>
                    <option value="9999">Vàng Nhẫn 9999</option>
                    <option value="24K">Vàng 24K</option>
                </select>
                <button type="submit" class="btn">Xem giá</button>
                
                <% if(request.getAttribute("goldPrice") != null) { %>
                    <div class="result-box">Giá hiện tại: <%= request.getAttribute("goldPrice") %></div>
                <% } %>
            </form>
        </div>

        <div class="card" style="border: 1px dashed #4f46e5; background: #f5f3ff;">
            <h3 style="color: #4f46e5;">📦 4. Quản lý kho hàng Northwind (Nâng cao)</h3>
            <p style="font-size: 14px; color: #64748b; margin-top: 0; margin-bottom: 15px;">
                Hệ thống kết nối trực tiếp đến Cơ sở dữ liệu Microsoft SQL Server trong Docker để truy xuất, lọc và tìm kiếm danh sách sản phẩm theo thời gian thực.
            </p>
            <div class="form-group">
                <form action="products" method="GET" style="display: flex; gap: 10px; width: 100%;">
                    <input type="text" name="searchKeyword" class="form-input" style="flex: 1;" placeholder="Nhập tên sản phẩm để tìm nhanh (Ví dụ: Chai, Chang...)" />
                    <button type="submit" class="btn btn-search">Tìm ngay 🔍</button>
                </form>
            </div>
            <div style="margin-top: 15px; border-top: 1px solid #e9e3ff; padding-top: 12px; text-align: center;">
                <a href="products" style="color: #4f46e5; font-size: 14px; font-weight: 600; text-decoration: none;">👉 Xem toàn bộ danh sách sản phẩm mẫu Northwind</a>
            </div>
        </div>

    </div>

</body>
</html>