/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Account;
import entity.DanhMuc;
import entity.XeMay;
import entity.SoLuongXeDaBan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "Top10SanPhamControl", urlPatterns = {"/top10"})
public class Top10XeMayControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
       
        DAO dao = new DAO();
        List<XeMay> listAllProduct = dao.getAllProduct();
//        System.out.println(listAllProduct);
        List<SoLuongXeDaBan> listTop10Product = dao.getTop10SanPhamBanChay();
//        System.out.println("SoLuongXeDaBan");
//        System.out.println(listTop10Product);
        
        
        
        request.setAttribute("listAllProduct", listAllProduct);
        System.out.println(listAllProduct);
        request.setAttribute("listTop10Product", listTop10Product);
        System.out.println(listTop10Product);
        request.getRequestDispatcher("Top10SanPhamBanChay.jsp").forward(request, response);
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
