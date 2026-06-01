package controller;

import dao.ProductDAO;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProductServlet", urlPatterns = {"/timkiemsanpham"})
public class ListProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đặt tiếng Việt để tránh lỗi gõ từ khóa có dấu
        request.setCharacterEncoding("UTF-8");
        
        // Lấy từ khóa tìm kiếm từ thanh ô nhập dữ liệu
        String txtSearch = request.getParameter("searchKeyword");
        
        ProductDAO dao = new ProductDAO();
        List<Product> list;
        
        // Nếu người dùng có gõ từ khóa thì tìm theo tên, ngược lại thì lấy hết
        if (txtSearch != null && !txtSearch.trim().isEmpty()) {
            list = dao.searchProductsByName(txtSearch.trim());
            // Giữ lại từ khóa vừa gõ hiển thị lên ô tìm kiếm cho đẹp
            request.setAttribute("searchValue", txtSearch);
        } else {
            list = dao.getAllProducts();
        }
        
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}