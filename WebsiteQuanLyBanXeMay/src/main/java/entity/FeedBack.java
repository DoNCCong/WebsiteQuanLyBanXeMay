package entity;

import java.util.Date;

public class FeedBack {
	private int maAccount;
	private int maXe;
	private String noiDung;
	private Date ngayDanhGia;
	  
	public FeedBack(int maAccount, int maXe, String noiDung, Date ngayDanhGia) 
	{
		
		this.maAccount = maAccount;
		this.maXe = maXe;
		this.noiDung = noiDung;
		this.ngayDanhGia = ngayDanhGia;
	}
	
	public FeedBack() 
	{
		
	}
	
	@Override
	public String toString() 
	{
		return "FeedBack [maAccount=" + getMaAccount() + ", maXe=" + getMaXe() + ", noiDung=" + getNoiDung()
			+ ", ngayDanhGia=" + getNgayDanhGia() + "]";
	}
	
	public int getMaAccount() 
	{
		return maAccount;
	}
	
	public void setMaAccount(int maAccount) 
	{
		this.maAccount = maAccount;
	}
	
	public int getMaXe() 
	{
		return maXe;
	}
	
	public void setMaXe(int maXe) 
	{
		this.maXe = maXe;
	}
	
	public String getNoiDung() 
	{
		return noiDung;
	}
	
	public void setNoiDung(String noiDung) 
	{
		this.noiDung = noiDung;
	}
	
	public Date getNgayDanhGia() 
	{
		return ngayDanhGia;
	}
	
	public void setNgayDanhGia(Date ngayDanhGia) 
	{
		this.ngayDanhGia = ngayDanhGia;
	}
}
