package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ChuyenDoiServlet", urlPatterns = {"/convert"})
public class ChuyenDoiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/chuyenDoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 1. Đọc tham số "type" từ giao diện gửi lên thay vì "action"
        String type = request.getParameter("type");
        
        // 2. Xử lý Chuyển đổi Độ C sang Độ F
        if ("c2f".equals(type)) {
            try {
                String celsiusStr = request.getParameter("celsius");
                if (celsiusStr != null && !celsiusStr.isEmpty()) {
                    double celsius = Double.parseDouble(celsiusStr);
                    double fahrenheit = celsius * 9 / 5 + 32;
                    // Làm tròn 1 chữ số thập phân cho đẹp
                    double roundedF = Math.round(fahrenheit * 10.0) / 10.0;
                    request.setAttribute("resultC2F", roundedF);
                }
            } catch (Exception e) {
                request.setAttribute("resultC2F", "Lỗi định dạng số!");
            }
        }
        
        // 3. Xử lý Chuyển đổi USD sang VND
        if ("usd2vnd".equals(type)) {
            try {
                String usdStr = request.getParameter("usd");
                if (usdStr != null && !usdStr.isEmpty()) {
                    double usd = Double.parseDouble(usdStr);
                    double vnd = usd * 25000; // Tỷ giá giả định
                    request.setAttribute("resultUSD", String.format("%,.0f", vnd));
                }
            } catch (Exception e) {
                request.setAttribute("resultUSD", "Lỗi định dạng số!");
            }
        }
        
        // 4. Trả kết quả quay về giao diện chính
        request.getRequestDispatcher("/chuyenDoi.jsp").forward(request, response);
    }
}