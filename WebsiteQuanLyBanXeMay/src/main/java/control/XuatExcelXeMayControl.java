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





@WebServlet(name = "XuatExcelProductControl", urlPatterns = {"/xuatExcelProductControl"})
public class XuatExcelXeMayControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        DAO dao = new DAO();
        List<XeMay> list = dao.getAllProduct();
        
        System.out.print(list.get(0));

      

        
        int maximum=2147483647;
        int minimum=1;
        
        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum =  rn.nextInt(range) + minimum;

        
        FileOutputStream file=new FileOutputStream("C:\\ExcelWebsiteQuanLyBanXe\\"+"san-pham"+Integer.toString(randomNum)+".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet workSheet=workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;
        XSSFCell cell5;
        XSSFCell cell6;
        XSSFCell cell7;
        XSSFCell cell8;
        XSSFCell cell9;
        XSSFCell cell10;
        XSSFCell cell11;
        XSSFCell cell12;
        XSSFCell cell13;
        XSSFCell cell14;
        XSSFCell cell15;
        
        row=workSheet.createRow(0);
        cell0=row.createCell(0);
        cell0.setCellValue("Mã Xe");
        cell1=row.createCell(1);
        cell1.setCellValue("Tên Xe");
        cell2=row.createCell(2);
        cell2.setCellValue("Hình Ảnh 1");
        cell3=row.createCell(3);
        cell3.setCellValue("Giá Tiền");
        cell4=row.createCell(4);
        cell4.setCellValue("Title");
        cell5=row.createCell(5);
        cell5.setCellValue("Giới Thiệu");
        cell6=row.createCell(6);
        cell6.setCellValue("Khối Lượng");
        cell7=row.createCell(7);
        cell7.setCellValue("Dài x Rộng x Cao");
        cell8=row.createCell(8);
        cell8.setCellValue("Dung Tích Xi Lanh");
        cell9=row.createCell(9);
        cell9.setCellValue("Tỉ Số Nén");
        cell10=row.createCell(10);
        cell10.setCellValue("Dung Tích Bình Xăng");
        cell11=row.createCell(11);
        cell11.setCellValue("Hình Ảnh 2");
        cell12=row.createCell(12);
        cell12.setCellValue("Hình Ảnh 3");
        cell13=row.createCell(13);
        cell13.setCellValue("Hình Ảnh 4");
        
        int i=0;
        
        for (XeMay pro : list) {
        	i=i+1;
        			 row=workSheet.createRow(i);
        			 cell0=row.createCell(0);
        		     cell0.setCellValue(pro.getMaXe());
        		     cell1=row.createCell(1);
        		     cell1.setCellValue(pro.getTenXe());
        		     cell2=row.createCell(2);
        		     cell2.setCellValue(pro.getHinhAnh1());
        		     cell3=row.createCell(3);
        		     cell3.setCellValue(pro.getGiaTien());	
        		     cell4=row.createCell(4);
        		     cell4.setCellValue(pro.getTitle());	
        		     cell5=row.createCell(5);
        		     cell5.setCellValue(pro.getGioiThieu());	
        		     cell6=row.createCell(6);
        		     cell6.setCellValue(pro.getKhoiLuong());	
        		     cell7=row.createCell(7);
        		     cell7.setCellValue(pro.getDaiRongCao());	
        		     cell8=row.createCell(8);
        		     cell8.setCellValue(pro.getDungTichXiLanh());	
        		     cell9=row.createCell(9);
        		     cell9.setCellValue(pro.getTiSoNen());
        		     cell10=row.createCell(10);
        		     cell10.setCellValue(pro.getDungTichBinhXang());	
        		     cell11=row.createCell(11);
        		     cell11.setCellValue(pro.getHinhAnh2());	
        		     cell12=row.createCell(12);
        		     cell12.setCellValue(pro.getHinhAnh3());	
        		     cell13=row.createCell(13);
        		     cell13.setCellValue(pro.getHinhAnh4());	
        }
               
        workbook.write(file);
        workbook.close();
        file.close();
        
        request.setAttribute("mess", "Đã xuất file Excel thành công. Vào thư mục C:\\ExcelWebsiteQuanLyBanXe trên máy để xem!");
        request.getRequestDispatcher("manager").forward(request, response); 
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
    }// </editor-fold>

}
