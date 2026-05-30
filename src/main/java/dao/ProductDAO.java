package dao;

import context.DBContext;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock FROM Products";
        try {
            conn = new DBContext().getConnection();
            if (conn == null) {
                System.out.println("❌ LỖI: Không thể kết nối đến SQL Server. Kiểm tra lại DBContext!");
                return list;
            }
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getInt("SupplierID"),
                        rs.getInt("CategoryID"),
                        rs.getString("QuantityPerUnit"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return list;
    }
    public List<Product> searchProductsByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock "
                   + "FROM Products WHERE ProductName LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%"); // Tìm kiếm theo từ khóa chứa trong tên
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getInt("SupplierID"),
                        rs.getInt("CategoryID"),
                        rs.getString("QuantityPerUnit"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return list;
    }
}