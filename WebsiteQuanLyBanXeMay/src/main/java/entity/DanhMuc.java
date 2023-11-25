/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author trinh
 */
public class DanhMuc {
	private int maDanhMuc;
	private String tenDanhMuc;
	
	public DanhMuc() 
	{
		
	}
	
	public DanhMuc(int maDanhMuc, String tenDanhMuc) 
	{
	    this.setMaDanhMuc(maDanhMuc);
	    this.setTenDanhMuc(tenDanhMuc);
	}
	
	@Override
	public String toString() 
	{
	    return "DanhMuc{" + "maDanhMuc=" + getMaDanhMuc() + ", tenDanhMuc=" + getTenDanhMuc() + '}';
	}
	
	public int getMaDanhMuc() 
	{
		return maDanhMuc;
	}
	
	public void setMaDanhMuc(int maDanhMuc) 
	{
		this.maDanhMuc = maDanhMuc;
	}
	
	public String getTenDanhMuc() 
	{
		return tenDanhMuc;
	}
	
	public void setTenDanhMuc(String tenDanhMuc) 
	{
		this.tenDanhMuc = tenDanhMuc;
	}
}
