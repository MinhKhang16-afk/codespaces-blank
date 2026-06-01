<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HCE - Công Cụ Đa Tiện Ích Chuyển Đổi</title>
    <style>
        body { 
            font-family: Arial, Helvetica, sans-serif; 
            margin: 0; padding: 0 0 50px 0; background-color: #f1f3f7; color: #333333;
            display: flex; flex-direction: column; align-items: center;
        }
        /* Layout chia 2 form nằm cạnh nhau cân bằng */
        .container { 
            width: 100%; max-width: 1100px; margin-top: 40px; padding: 0 20px; 
            box-sizing: border-box; display: flex; gap: 30px;
        }
        
        .content-card {
            flex: 1; background: #ffffff; border-radius: 16px; padding: 35px 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05); display: flex; flex-direction: column;
        }
        
        .content-card h2 {
            font-size: 20px; color: #b4191f; margin-top: 0; margin-bottom: 25px;
            font-weight: bold; text-align: center; border-bottom: 2px solid #f1f3f7; padding-bottom: 12px;
        }
        
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 14px; font-weight: bold; margin-bottom: 8px; color: #555555; }
        .form-input { width: 100%; padding: 12px 14px; border: 1px solid #cccccc; border-radius: 6px; font-size: 15px; outline: none; box-sizing: border-box; color: #333333; }
        .form-input:focus { border-color: #b4191f; }
        
        .btn-submit { width: 100%; background-color: #b4191f; color: white; border: none; padding: 12px; font-size: 15px; border-radius: 6px; cursor: pointer; font-weight: bold; transition: background 0.2s; }
        .btn-submit:hover { background-color: #931217; }
        
        .result-box { margin-top: auto; padding: 15px; background-color: #e8f5e9; border-radius: 6px; font-size: 15px; font-weight: bold; color: #2e7d32; border-left: 5px solid #4caf50; text-align: center; }
    </style>
</head>
<body>

    <div style="background-color: #ffffff; width: 100%; font-family: Arial, sans-serif; border-bottom: 1px solid #e5e5e5; color: #333333;">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 15px 20px; box-sizing: border-box;">
            
            <div style="display: flex; gap: 20px; font-size: 11.5px; font-weight: bold; letter-spacing: 0.3px;">
                <a href="${pageContext.request.contextPath}/timsanpham" style="color: #b4191f; text-decoration: none; border: 1px solid #b4191f; padding: 6px 12px; border-radius: 4px; background: #fff5f5;">🔙 QUAY LẠI TÌM KIẾM</a>
                <a href="#" style="color: #777777; text-decoration: none; padding-top: 7px;">EGOV</a>
                <a href="#" style="color: #777777; text-decoration: none; padding-top: 7px;">SINH VIÊN</a>
            </div>
            
            <div style="display: flex; align-items: center; max-width: 550px;">
                <img src="${pageContext.request.contextPath}/images/Ten-truong-do-1000x159.png" 
                     alt="Trường Cao đẳng Kinh tế Thành phố Hồ Chí Minh" 
                     style="width: 100%; height: auto; max-height: 60px; object-fit: contain;">
            </div>

            <div style="display: flex; align-items: center; border-bottom: 1px solid #cccccc; padding-bottom: 4px; width: 180px;">
                <input type="text" placeholder="Tìm kiếm..." style="border: none; outline: none; font-size: 13px; width: 100%; color: #555555; background: transparent;">
                <span style="color: #b4191f; font-size: 14px; cursor: pointer;">🔍</span>
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
            <h2>🌡️ Chuyển Đổi Nhiệt Độ</h2>
            <form action="<%= request.getContextPath() %>/chuyendoi" method="post">
                <input type="hidden" name="type" value="temperature">
                <div class="form-group">
                    <label>Nhập giá trị độ C (°C):</label>
                    <input type="text" name="km" class="form-input" placeholder="Ví dụ: 37" 
                           value="<%= request.getAttribute("oldCelsius") != null ? request.getAttribute("oldCelsius") : "" %>" required>
                </div>
                <button type="submit" class="btn-submit">Chuyển sang độ F</button>
            </form>

            <% if (request.getAttribute("result") != null) { %>
                <div class="result-box" style="margin-top: 25px;">
                    <%= request.getAttribute("result") %>
                </div>
            <% } %>
        </div>

        <div class="content-card">
            <h2>💵 Chuyển Đổi Tiền Tệ (Tỷ giá: 25.450)</h2>
            <form action="<%= request.getContextPath() %>/chuyendoi" method="post">
                <input type="hidden" name="type" value="currency">
                <div class="form-group">
                    <label>Nhập số tiền USD ($):</label>
                    <input type="text" name="usdAmount" class="form-input" placeholder="Ví dụ: 10" 
                           value="<%= request.getAttribute("oldUsd") != null ? request.getAttribute("oldUsd") : "" %>" required>
                </div>
                <button type="submit" class="btn-submit">Chuyển sang Việt Nam Đồng</button>
            </form>

            <% if (request.getAttribute("currencyResult") != null) { %>
                <div class="result-box" style="margin-top: 25px;">
                    <%= request.getAttribute("currencyResult") %>
                </div>
            <% } %>
        </div>

    </div>

</body>
</html>