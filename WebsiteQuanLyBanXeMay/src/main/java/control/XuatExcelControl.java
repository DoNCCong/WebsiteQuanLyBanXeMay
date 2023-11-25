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





@WebServlet(name = "XuatExcelControl", urlPatterns = {"/xuatExcelControl"})
public class XuatExcelControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        String ngayXuat = request.getParameter("dateHoaDon"); 
        DAO dao = new DAO();
        
        List<HoaDon> list = dao.searchByNgayXuat(ngayXuat);
        List<Account> listAllAccount = dao.getAllAccount();
        //DatTenFile
        int maximum=2147483647;
        int minimum=1;
        
        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum =  rn.nextInt(range) + minimum;

        
        FileOutputStream file=new FileOutputStream("C:\\ExcelWebsiteQuanLyBanXe\\"+"hoa-don-"+ngayXuat+"-"+Integer.toString(randomNum)+".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet workSheet=workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        
        row=workSheet.createRow(0);
        cell0=row.createCell(0);
        cell0.setCellValue("Mã Hóa Đơn");
        cell1=row.createCell(1);
        cell1.setCellValue("Account");
        cell2=row.createCell(2);
        cell2.setCellValue("Tổng Giá($)");
        cell3=row.createCell(3);
        cell3.setCellValue("Ngày Xuất");
        
        double tongGia;
        int i=0;
        
        for (HoaDon o : list) {
        	i=i+1;
        	for (Account a : listAllAccount) {
        		if(o.getMaAccount()==a.getMaAccount()) {
        			tongGia=Math.round((o.getTongTien()) * 100.0) / 100.0;
        			 row=workSheet.createRow(i);
        			 cell0=row.createCell(0);
        		     cell0.setCellValue(o.getMaHoaDon());
        		     cell1=row.createCell(1);
        		     cell1.setCellValue(a.getUsername());
        		     cell2=row.createCell(2);
        		     cell2.setCellValue(tongGia);
        		     cell3=row.createCell(3);
        		     cell3.setCellValue(ngayXuat);	
        		}
        		}
        }
        workbook.write(file);
        workbook.close();
        file.close();
        request.setAttribute("mess", "Đã xuất file Excel thành công. Vào thư mục C:\\ExcelWebsiteQuanLyBanXe trên máy để xem!");
        request.getRequestDispatcher("hoaDon").forward(request, response);

       
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
