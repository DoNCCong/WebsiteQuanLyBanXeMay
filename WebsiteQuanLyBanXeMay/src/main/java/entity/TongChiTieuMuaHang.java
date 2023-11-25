package entity;

public class TongChiTieuMuaHang {
	private int maAccount;
	private double tongChiTieu;
	
	public TongChiTieuMuaHang(int maAccount, double tongChiTieu) 
	{
		
		this.setMaAccount(maAccount);
		this.setTongChiTieu(tongChiTieu);
	}
	
	public TongChiTieuMuaHang() 
	{
		
	}
	
	@Override
	public String toString() 
	{
		return "TongChiTieuMuaHang [maAccount=" + getMaAccount() + ", tongChiTieu=" + getTongChiTieu() + "]";
	}
	
	public int getMaAccount() 
	{
		return maAccount;
	}
	
	public void setMaAccount(int maAccount) 
	{
		this.maAccount = maAccount;
	}
	
	public double getTongChiTieu() 
	{
		return tongChiTieu;
	}
	
	public void setTongChiTieu(double tongChiTieu) 
	{
		this.tongChiTieu = tongChiTieu;
	}
}
