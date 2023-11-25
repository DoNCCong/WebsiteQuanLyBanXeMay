/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteControl", urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pid = request.getParameter("pid");
        DAO dao = new DAO();
        dao.deleteCartByProductID(pid);
        dao.deleteReviewByProductID(pid);
        dao.deleteSoLuongDaBanByProductID(pid);
        String del = dao.deleteProduct(pid);
        if(del=="1")
        {
        	request.setAttribute("mess", "Thực Hiện Xóa Xe Thành Công!");
        }
        else
        {
        	request.setAttribute("error", "Không Thể Xóa Xe Này Vì Có Khách Hàng Đang Thêm Vào Giỏ Hàng! Hãy "
        			+ "Liên Lạc Lại Với Khách Hàng!!!");
        }
        
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
