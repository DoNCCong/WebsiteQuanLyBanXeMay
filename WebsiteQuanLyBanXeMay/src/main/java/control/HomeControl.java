/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.DanhMuc;
import entity.XeMay;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //b1: get data from dao
        DAO dao = new DAO();
//        List<Product> list = dao.getAllProduct();
        List<DanhMuc> listDanhMuc = dao.getAllDanhMuc(); // listC đổi thành listDanhMuc
        List<XeMay> list = dao.getTop3();
        List<XeMay> list8Last = dao.get8Last();
        List<XeMay> list4VisionLast = dao.get4VisionLast(); // list4NikeLast doi thanh list4VisionLast
        List<XeMay> list4AirBladeLast = dao.get4AirBladeLast(); // list4AdidasLast doi thanh list4AirBladeLast
        
        
        XeMay last = dao.getLast();
        
        //b2: set data to jsp
        request.setAttribute("listP", list);
        request.setAttribute("listCC", listDanhMuc);
        request.setAttribute("list8Last", list8Last);
        request.setAttribute("list4NikeLast", list4VisionLast);
        request.setAttribute("list4AdidasLast", list4AirBladeLast);
        request.setAttribute("p", last);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
        //404 -> url
        //500 -> jsp properties
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
