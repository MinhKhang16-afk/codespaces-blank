package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.SanPham;

@WebServlet("/san-pham")
public class SanPhamServlet extends HttpServlet {

    // CẢI TIẾN 2: Khởi tạo danh sách dữ liệu mẫu lớn và phong phú để tìm kiếm
    private List<SanPham> initializeProducts() {
        List<SanPham> list = new ArrayList<>();
        
        // Nhóm sản phẩm iPhone
        list.add(new SanPham("SP01", "Điện thoại iPhone 15 Pro Max", 34000000));
        list.add(new SanPham("SP02", "Điện thoại iPhone 14 128GB", 18500000));
        list.add(new SanPham("SP03", "Điện thoại iPhone 13 Pro cũ", 15000000));
        
        // Nhóm sản phẩm Samsung
        list.add(new SanPham("SP04", "Điện thoại Samsung Galaxy S24 Ultra", 30000000));
        list.add(new SanPham("SP05", "Điện thoại Samsung Galaxy A55 5G", 9500000));
        
        // Nhóm sản phẩm Laptop
        list.add(new SanPham("SP06", "Laptop ASUS ROG Strix Gaming", 25500000));
        list.add(new SanPham("SP07", "Laptop MacBook Air M3 2024", 29000000));
        list.add(new SanPham("SP08", "Laptop Dell XPS 13 Sang Trọng", 32000000));
        
        // Nhóm sản phẩm Phụ kiện công nghệ
        list.add(new SanPham("SP09", "Tai nghe không dây Sony WH-1000XM5", 6500000));
        list.add(new SanPham("SP10", "Chuột chơi game Logitech G502 Hero", 1200000));
        list.add(new SanPham("SP11", "Bàn phím cơ AKKO 3078 Silent", 1800000));
        
        return list;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String keyword = request.getParameter("searchKeyword");
        
        List<SanPham> allProducts = initializeProducts();
        List<SanPham> filteredProducts = new ArrayList<>();

        // Logic bộ lọc: Nếu từ khóa trống -> Hiện tất cả. Nếu có từ khóa -> Lọc theo tên gần đúng
        if (keyword == null || keyword.trim().isEmpty()) {
            filteredProducts = allProducts;
        } else {
            String lowerKeyword = keyword.toLowerCase().trim();
            for (SanPham sp : allProducts) {
                if (sp.getTenSp().toLowerCase().contains(lowerKeyword)) {
                    filteredProducts.add(sp);
                }
            }
        }

        // Đẩy danh sách đã lọc và từ khóa vừa tìm ngược lại trang JSP
        request.setAttribute("dsSanPham", filteredProducts);
        request.getRequestDispatcher("sanPham.jsp").forward(request, response);
    }
}