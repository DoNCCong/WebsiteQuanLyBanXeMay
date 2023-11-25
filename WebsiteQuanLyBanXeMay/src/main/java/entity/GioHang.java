package entity;

public class GioHang {
	private int maGioHang;
	private int maAccount;
	private int maXe;
	private int soLuong;
		 
	public GioHang(int maGioHang, int maAccount, int maXe, int soLuong) 
	{
		this.setMaGioHang(maGioHang);
		this.setMaAccount(maAccount);
		this.setMaXe(maXe);
		this.setSoLuong(soLuong);
	}
	
	public GioHang() 
	{
		
	}
	
	@Override
	public String toString() 
	{
		return "GioHang [maGioHang=" + getMaGioHang() + ", maAccount=" + getMaAccount() + ", maXe=" + getMaXe() 
				+ ", soLuong=" + getSoLuong() + "]";
	}
	
	public int getMaGioHang() 
	{
		return maGioHang;
	}
	
	public void setMaGioHang(int maGioHang) 
	{
		this.maGioHang = maGioHang;
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
	
	public int getSoLuong() 
	{
		return soLuong;
	}
	
	public void setSoLuong(int soLuong) 
	{
		this.soLuong = soLuong;
	} 
	 
	
}
