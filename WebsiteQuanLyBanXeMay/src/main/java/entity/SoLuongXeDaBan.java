package entity;

public class SoLuongXeDaBan {
	private int maXe;
	private int soLuongDaBan;
		  
	public SoLuongXeDaBan(int maXe, int soLuongDaBan) 
	{
	
		this.setMaXe(maXe);
		this.setSoLuongDaBan(soLuongDaBan);
	}
	
	public SoLuongXeDaBan() 
	{
		
	}
	
	@Override
	public String toString() 
	{
		return "SoLuongXeDaBan [maXe=" + getMaXe() + ", soLuongDaBan=" + getSoLuongDaBan() + "]";
	}
	
	public int getMaXe() 
	{
		return maXe;
	}
	
	public void setMaXe(int maXe) 
	{
		this.maXe = maXe;
	}
	
	public int getSoLuongDaBan() 
	{
		return soLuongDaBan;
	}
	
	public void setSoLuongDaBan(int soLuongDaBan) 
	{
		this.soLuongDaBan = soLuongDaBan;
	}
}
