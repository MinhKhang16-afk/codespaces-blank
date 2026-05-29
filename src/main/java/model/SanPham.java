package model;

public class SanPham {
    private String maSp;
    private String tenSp;
    private double gia;

    public SanPham(String maSp, String tenSp, double gia) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.gia = gia;
    }

    public String getMaSp() { return maSp; }
    public String getTenSp() { return tenSp; }
    public double getGia() { return gia; }
}
