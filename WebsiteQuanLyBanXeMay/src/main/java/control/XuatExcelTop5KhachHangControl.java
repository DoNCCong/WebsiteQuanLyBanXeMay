/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;

import entity.Account;
import entity.DanhMuc;
import entity.HoaDon;
import entity.XeMay;
import entity.TongChiTieuMuaHang;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;





@WebServlet(name = "XuatExcelTop5CustomerControl", urlPatterns = {"/xuatExcelTop5CustomerControl"})
public class XuatExcelTop5KhachHangControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        DAO dao = new DAO();
        List<Account> listAllAccount = dao.getAllAccount();
        List<TongChiTieuMuaHang> listTop5KhachHang = dao.getTop5KhachHang();
        
        int maximum=2147483647;
        int minimum=1;
        
        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum =  rn.nextInt(range) + minimum;

        
        FileOutputStream file=new FileOutputStream("C:\\ExcelWebsiteQuanLyBanXe\\"+"top-5-khach-hang-"+Integer.toString(randomNum)+".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet workSheet=workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        
        row=workSheet.createRow(0);
        cell0=row.createCell(0);
        cell0.setCellValue("Mã Account");
        cell1=row.createCell(1);
        cell1.setCellValue("Username");
        cell2=row.createCell(2);
        cell2.setCellValue("Email");
        cell3=row.createCell(3);
        cell3.setCellValue("Tổng chi tiêu");
    
        
        int i=0;
        
        for (TongChiTieuMuaHang top5 : listTop5KhachHang) {
        	  for (Account acc : listAllAccount) {
        		  if(top5.getMaAccount() == acc.getMaAccount()) {
        			  	i=i+1;
	 	     			 row=workSheet.createRow(i);
	 	     			 cell0=row.createCell(0);
	 	     		     cell0.setCellValue(acc.getMaAccount());
	 	     		     cell1=row.createCell(1);
	 	     		     cell1.setCellValue(acc.getUsername());
	 	     		     cell2=row.createCell(2);
	 	     		     cell2.setCellValue(acc.getEmail());
	 	     		     cell3=row.createCell(3);
	 	     		     cell3.setCellValue(top5.getTongChiTieu());	
        		  }
        	  }
        }
               
        workbook.write(file);
        workbook.close();
        file.close();
        
        request.setAttribute("mess", "Đã xuất file Excel thành công. Vào thư mục C:\\ExcelWebsiteQuanLyBanXe trên máy để kiểm tra!");
        request.getRequestDispatcher("top5khachhang").forward(request, response); 
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
