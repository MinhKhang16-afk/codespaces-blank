<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trường Cao đẳng Kinh tế Thành phố Hồ Chí Minh - HCE</title>
    <style>
        body { 
            font-family: Arial, Helvetica, sans-serif; 
            margin: 0; padding: 0 0 40px 0; background-color: #f8fafc; color: #1e293b;
            display: flex; flex-direction: column; align-items: center;
        }
        .container { width: 100%; max-width: 1200px; margin-top: 30px; padding: 0 20px; box-sizing: border-box; }
        
        /* Giao diện Card chức năng */
        .card { 
            background: white; padding: 24px; border-radius: 8px; border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05); margin-bottom: 20px;
        }
        .card h3 { margin-top: 0; margin-bottom: 15px; color: #a22126; font-size: 16px; font-weight: bold; text-transform: uppercase; }
        
        .form-group { display: flex; gap: 12px; align-items: center; flex-wrap: wrap; }
        label { font-size: 14px; color: #475569; font-weight: bold; }
        .form-input, select { 
            padding: 10px 16px; border: 1px solid #cbd5e1; border-radius: 4px; 
            font-size: 14px; outline: none; min-width: 180px; background: white;
        }
        
        .btn { 
            display: inline-block; text-decoration: none; padding: 10px 20px; 
            background-color: #a22126; color: white; border-radius: 4px; 
            font-size: 14px; font-weight: bold; border: none; cursor: pointer; text-transform: uppercase;
        }
        .btn:hover { background-color: #821a1e; }
        .result-box { margin-left: auto; font-size: 15px; font-weight: bold; color: #059669; background: #e6f4ea; padding: 8px 16px; border-radius: 4px; }
    </style>
</head>
<body>

    <div style="background-color: #ffffff; width: 100%; border-bottom: 1px solid #e2e8f0; font-family: Arial, sans-serif;">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 25px 20px 20px 20px; box-sizing: border-box;">
            
            <div style="display: flex; gap: 20px; font-size: 12px; font-weight: bold; text-transform: uppercase; letter-spacing: 0.5px;">
                <a href="chuyenDoi.jsp" style="color: #a22126; text-decoration: none; border-bottom: 2px solid #a22126; padding-bottom: 4px;">TRANG CHỦ</a>
                <a href="#" style="color: #7c7c7c; text-decoration: none;">EGOV</a>
                <a href="#" style="color: #7c7c7c; text-decoration: none;">SINH VIÊN</a>
            </div>
            
            <div style="display: flex; align-items: center; gap: 15px; margin-left: -50px;">
                <svg width="60" height="60" viewBox="0 0 100 110" style="flex-shrink: 0;">
                    <path d="M50 5 L88 30 L88 75 L50 105 L12 75 L12 30 Z" fill="none" stroke="#a22126" stroke-width="4"/>
                    <path d="M50 12 L82 35 L82 70 L50 96 L18 70 L18 35 Z" fill="none" stroke="#a22126" stroke-width="1.5"/>
                    <path d="M36 78 C34 72 35 64 39 56 C42 48 48 40 50 30 C52 40 58 48 61 56 C65 64 66 72 64 78 C60 84 50 86 50 86 C50 86 40 84 36 78 Z" fill="#a22126"/>
                    <path d="M43 76 C41 72 42 66 45 61 C48 56 50 50 50 44 C50 50 52 56 55 61 C58 66 59 72 57 76 C55 80 50 81 50 81 C50 81 45 80 43 76 Z" fill="#ffffff"/>
                    <text x="50" y="100" font-family="Arial" font-size="11" font-weight="900" fill="#a22126" text-anchor="middle" letter-spacing="1">HCE</text>
                </svg>
                <div style="text-align: left;">
                    <div style="margin: 0; font-size: 21px; color: #a22126; font-weight: bold; font-family: Arial, sans-serif; letter-spacing: -0.2px;">TRƯỜNG CAO ĐẲNG KINH TẾ THÀNH PHỐ HỒ CHÍ MINH</div>
                    <div style="margin: 4px 0 0 0; font-size: 13.5px; color: #333333; font-weight: bold; font-family: Arial, sans-serif; letter-spacing: 0.4px;">HO CHI MINH CITY COLLEGE OF ECONOMICS</div>
                </div>
            </div>

            <div style="display: flex; align-items: center; border-bottom: 1px solid #cccccc; padding-bottom: 6px; width: 220px;">
                <input type="text" placeholder="Tìm kiếm" style="border: none; outline: none; font-size: 14px; width: 100%; color: #444444; background: transparent; font-family: Arial, sans-serif;">
                <span style="color: #a22126; font-size: 16px; font-weight: bold; cursor: pointer;">🔍</span>
            </div>
        </div>

        <div style="background-color: #a22126; width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
            <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: flex-start; gap: 40px; padding: 14px 20px; font-size: 14px; font-weight: bold; color: #ffffff; box-sizing: border-box; text-transform: uppercase; font-family: Arial, sans-serif;">
                <div style="cursor: pointer; display: flex; align-items: center; gap: 4px;">GIỚI THIỆU <span style="font-size: 10px;">▼</span></div>
                <div style="cursor: pointer;">TIN TỨC - SỰ KIỆN</div>
                <div style="cursor: pointer; display: flex; align-items: center; gap: 4px;">TUYỂN SINH <span style="font-size: 10px;">▼</span></div>
                <div style="cursor: pointer; display: flex; align-items: center; gap: 4px;">CÔNG KHAI GIÁO DỤC <span style="font-size: 10px;">▼</span></div>
                <div style="cursor: pointer; display: flex; align-items: center; gap: 4px;">CƠ CẤU TỔ CHỨC <span style="font-size: 10px;">▼</span></div>
                <a href="timkiemsanpham" style="color: #fde047; text-decoration: none; display: flex; align-items: center; gap: 4px;">KHO HÀNG NORTHWIND 🌟</a>
            </div>
        </div>
    </div>

    <div class="container">
        <h2 style="font-size: 22px; font-weight: bold; color: #0f172a; margin-bottom: 25px; text-align: center;">BÀI GIỮA KỲ: HỆ THỐNG ĐIỀU HƯỚNG & CHUYỂN ĐỔI LOGIC</h2>

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
    </div>

</body>
</html>