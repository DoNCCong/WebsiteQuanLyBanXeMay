/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author 
 */
public class XeMay {
    private int maXe;
    private String tenXe;
    private String hinhAnh1;
    private Double giaTien;
    private String title;
    private String gioiThieu;
    private String khoiLuong;
    private String daiRongCao;
    private String dungTichXiLanh;
    private String tiSoNen;
    private String dungTichBinhXang;
    private String hinhAnh2;
    private String hinhAnh3;
    private String hinhAnh4;

    
	public XeMay(int maXe, String tenXe, String hinhAnh1, Double giaTien, String title, 
			String gioiThieu, String khoiLuong, String daiRongCao, String dungTichXiLanh, 
			String tiSoNen, String dungTichBinhXang, String hinhAnh2, String hinhAnh3, String hinhAnh4) 
	{		
		this.setMaXe(maXe);
		this.setTenXe(tenXe);
		this.setHinhAnh1(hinhAnh1);
		this.setGiaTien(giaTien);
		this.setTitle(title);
		this.setGioiThieu(gioiThieu);
		this.setKhoiLuong(khoiLuong);
		this.setDaiRongCao(daiRongCao);
		this.setDungTichXiLanh(dungTichXiLanh);
		this.setTiSoNen(tiSoNen);
		this.setDungTichBinhXang(dungTichBinhXang);
		this.setHinhAnh2(hinhAnh2);
		this.setHinhAnh3(hinhAnh3);
		this.setHinhAnh4(hinhAnh4);
	}
	
	public XeMay() 
	{
		
	}
	
	@Override
	public String toString() 
	{
		return "XeMay [maXe=" + getMaXe() + ", tenXe=" + getTenXe() + ", hinhAnh1=" + getHinhAnh1() + ", "
				+ "giaTien=" + getGiaTien() + ", title=" + getTitle()
				+ ", gioiThieu=" + getGioiThieu() + ", khoiLuong=" + getKhoiLuong() + ", daiRongCao=" + getDaiRongCao() 
				+ ", dungTichXiLanh=" + getDungTichXiLanh()
				+ ", tiSoNen=" + getTiSoNen() + ", dungTichBinhXang=" + getDungTichBinhXang() 
				+ ", hinhAnh2=" + getHinhAnh2() + ", hinhAnh3=" + getHinhAnh3() + ", hinhAnh4=" + getHinhAnh4() + "]";
	}
	
	public int getMaXe() 
	{
		return maXe;
	}
	
	public void setMaXe(int maXe) 
	{
		this.maXe = maXe;
	}
	
	public String getTenXe() 
	{
		return tenXe;
	}
	
	public void setTenXe(String tenXe) 
	{
		this.tenXe = tenXe;
	}
	
	public String getHinhAnh1() 
	{
		return hinhAnh1;
	}
	
	public void setHinhAnh1(String hinhAnh1) 
	{
		this.hinhAnh1 = hinhAnh1;
	}
	
	public Double getGiaTien() 
	{
		return giaTien;
	}
	
	public void setGiaTien(Double giaTien) 
	{
		this.giaTien = giaTien;
	}
	
	public String getTitle() 
	{
		return title;
	}
	
	public void setTitle(String title) 
	{
		this.title = title;
	}
	
	public String getGioiThieu() 
	{
		return gioiThieu;
	}
	
	public void setGioiThieu(String gioiThieu) 
	{
		this.gioiThieu = gioiThieu;
	}
	
	public String getKhoiLuong() 
	{
		return khoiLuong;
	}
	
	public void setKhoiLuong(String khoiLuong) 
	{
		this.khoiLuong = khoiLuong;
	}
	
	public String getDaiRongCao() {
		return daiRongCao;
	}
	
	public void setDaiRongCao(String daiRongCao) 
	{
		this.daiRongCao = daiRongCao;
	}
	
	public String getDungTichXiLanh() 
	{
		return dungTichXiLanh;
	}
	
	public void setDungTichXiLanh(String dungTichXiLanh) 
	{
		this.dungTichXiLanh = dungTichXiLanh;
	}
	
	public String getTiSoNen() 
	{
		return tiSoNen;
	}
	
	public void setTiSoNen(String tiSoNen) 
	{
		this.tiSoNen = tiSoNen;
	}
	
	public String getDungTichBinhXang() 
	{
		return dungTichBinhXang;
	}
	
	public void setDungTichBinhXang(String dungTichBinhXang) 
	{
		this.dungTichBinhXang = dungTichBinhXang;
	}
	
	public String getHinhAnh2() 
	{
		return hinhAnh2;
	}
	
	public void setHinhAnh2(String hinhAnh2) 
	{
		this.hinhAnh2 = hinhAnh2;
	}
	
	public String getHinhAnh3() 
	{
		return hinhAnh3;
	}
	
	public void setHinhAnh3(String hinhAnh3) 
	{
		this.hinhAnh3 = hinhAnh3;
	}
	
	public String getHinhAnh4() 
	{
		return hinhAnh4;
	}
	
	public void setHinhAnh4(String hinhAnh4) 
	{
		this.hinhAnh4 = hinhAnh4;
	}
}
