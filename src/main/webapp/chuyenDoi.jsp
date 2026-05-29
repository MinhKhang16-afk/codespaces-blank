<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ứng dụng Chuyển Đổi & Tra Cứu</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f9f9f9; }
        h2 { color: #222; }
        .section { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 5px; max-width: 450px; background-color: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        h3 { color: #333; margin-top: 0; }
        .result { color: #2e7d32; font-weight: bold; margin-top: 10px; padding: 5px; background-color: #e8f5e9; border-radius: 3px; display: inline-block; }
        button { cursor: pointer; padding: 6px 12px; border-radius: 4px; border: 1px solid #ccc; background-color: #f0f0f0; }
        button:hover { background-color: #e0e0e0; }
        input[type="number"], input[type="text"], select { padding: 5px; border-radius: 4px; border: 1px solid #ccc; margin-right: 5px; }
    </style>
</head>
<body>

    <h2>BÀI GIỮA KỲ: ỨNG DỤNG CHUYỂN ĐỔI</h2>

    <div class="section">
        <h3>1. Chuyển đổi Độ C sang Độ F</h3>
        <form action="<%= request.getContextPath() %>/chuyen-doi" method="post">
            <input type="hidden" name="action" value="convertCelsius">
            Nhập độ C: <input type="number" step="any" name="celsius" required>
            <button type="submit">Chuyển đổi</button>
        </form>
        <% if ("convertCelsius".equals(request.getAttribute("resultType"))) { %>
            <div class="result">Kết quả: <%= request.getAttribute("resultValue") %> °F</div>
        <% } %>
    </div>

    <div class="section">
        <h3>2. Chuyển đổi USD sang VND</h3>
        <form action="<%= request.getContextPath() %>/chuyen-doi" method="post">
            <input type="hidden" name="action" value="convertUsd">
            Nhập số tiền (USD): <input type="number" step="any" name="usd" required>
            <button type="submit">Chuyển đổi</button>
        </form>
        <% if ("convertUsd".equals(request.getAttribute("resultType"))) { %>
            <div class="result">Kết quả: <%= request.getAttribute("resultValue") %> VND</div>
        <% } %>
    </div>

    <div class="section">
        <h3>3. Tra cứu Giá Vàng</h3>
        <form action="<%= request.getContextPath() %>/chuyen-doi" method="post">
            <input type="hidden" name="action" value="getGoldPrice">
            Chọn loại vàng:
            <select name="goldType">
                <option value="SJC">Vàng SJC</option>
                <option value="9999">Vàng 9999</option>
                <option value="24K">Vàng 24K</option>
            </select>
            <button type="submit">Xem giá</button>
        </form>
        <% if ("getGoldPrice".equals(request.getAttribute("resultType"))) { %>
            <div class="result">Giá vàng: <%= request.getAttribute("resultValue") %></div>
        <% } %>
    </div>

    <div class="section" style="border-color: #2196F3; background-color: #e3f2fd;">
        <h3 style="color: #0d47a1;">4. Tìm nhanh sản phẩm (Nâng cao)</h3>
        <form action="<%= request.getContextPath() %>/san-pham" method="get">
            Nhập tên sản phẩm: 
            <input type="text" name="searchKeyword" placeholder="Ví dụ: iPhone, Laptop, Chuột..." style="width: 200px;">
            <button type="submit" style="background-color: #2196F3; color: white; border: none; font-weight: bold;">Tìm ngay</button>
        </form>
    </div>

    <hr style="max-width: 450px; margin-left: 0; margin-top: 20px;">
    <p><a href="<%= request.getContextPath() %>/san-pham" style="color: #2196F3; text-decoration: none; font-weight: bold;">👉 Xem toàn bộ danh sách sản phẩm mẫu</a></p>

</body>
</html>