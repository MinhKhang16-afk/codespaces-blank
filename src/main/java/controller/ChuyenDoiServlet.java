package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/chuyen-doi")
public class ChuyenDoiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String resultType = "";
        String resultValue = "";

        if ("convertCelsius".equals(action)) {
            double celsius = Double.parseDouble(request.getParameter("celsius"));
            double fahrenheit = celsius * 1.8 + 32;
            resultType = "convertCelsius";
            resultValue = String.format("%.2f", fahrenheit);
        } else if ("convertUsd".equals(action)) {
            double usd = Double.parseDouble(request.getParameter("usd"));
            double vnd = usd * 25000;
            resultType = "convertUsd";
            resultValue = String.format("%,.0f", vnd);
        } else if ("getGoldPrice".equals(action)) {
            String goldType = request.getParameter("goldType");
            resultType = "getGoldPrice";
            if ("SJC".equals(goldType)) {
                resultValue = "Mua vào: 82tr - Bán ra: 84tr";
            } else if ("9999".equals(goldType)) {
                resultValue = "Mua vào: 81.5tr - Bán ra: 83.2tr";
            } else {
                resultValue = "Mua vào: 81tr - Bán ra: 82.8tr";
            }
        }

        request.setAttribute("resultType", resultType);
        request.setAttribute("resultValue", resultValue);
        request.getRequestDispatcher("chuyenDoi.jsp").forward(request, response);
    }
}
