package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

import entity.Account;
import entity.Email;
import entity.EmailUtils;
import entity.GioHang;
import entity.XeMay;
import entity.SoLuongXeDaBan;
import entity.TongChiTieuMuaHang;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        Account a = (Account) session.getAttribute("acc");
	        if(a == null) {
	        	response.sendRedirect("login");
	        	return;
	        }
	        int maAccount = a.getMaAccount();
	        DAO dao = new DAO();
	        List<GioHang> list = dao.getGioHangBymaAccount(maAccount);
	        List<XeMay> list2 = dao.getAllXeMay();
	        double totalMoney=0;
	        for(GioHang c : list) {
				for(XeMay p : list2) {
					if(c.getMaXe()==p.getMaXe()) {
						totalMoney=totalMoney+(p.getGiaTien()*c.getSoLuong());
					}
				}
			}
	        double totalMoneyVAT=totalMoney+totalMoney*0.1;
	        
//	        double tongTienBanHangThem=0;
//	        int sell_ID;
//	        for (GioHang c : list) {
//	            for (XeMay p : list2) {
//	                if (c.getMaXe() == p.getMaXe()) {
//	                    tongTienBanHangThem = 0;
//	                    sell_ID = dao.getSellIDByProductID(p.getId());
//	                    tongTienBanHangThem = tongTienBanHangThem + (p.getPrice() * c.getAmount());
//	                    TongChiTieuMuaHang t2 = dao.checkTongChiTieuBanHangExist(sell_ID);
//	                    if (t2 == null) {
//	                        dao.insertTongChiTieuBanHang(sell_ID, 0, tongTienBanHangThem);
//	                    } else {
//	                        dao.editTongBanHang(sell_ID, tongTienBanHangThem);
//	                    }
//	                }
//	            }
//	        }
	        
	        
	        for(GioHang c : list) {
				for(XeMay p : list2) {
					if(c.getMaXe()==p.getMaXe()) {
						SoLuongXeDaBan s = dao.checkSoLuongXeDaBanExist(p.getMaXe());
						if(s == null) {
							dao.insertSoLuongDaBan(p.getMaXe(), c.getSoLuong());
						}
						else {
							dao.editSoLuongDaBan(p.getMaXe(), c.getSoLuong());
						}	
					}
				}
			}
	        
	        dao.insertHoaDon(maAccount, totalMoneyVAT);
	        TongChiTieuMuaHang t = dao.checkTongChiTieuMuaHangExist(maAccount);
	        if(t==null) {
	        	dao.insertTongChiTieuMuaHang(maAccount,totalMoneyVAT);
	        }
	        else {
	        	dao.editTongChiTieu(maAccount, totalMoneyVAT);
	        }
	        
	        
		request.getRequestDispatcher("DatHang.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String emailAddress = request.getParameter("email");
			String name = request.getParameter("name");
			String phoneNumber = request.getParameter("phoneNumber");
			String deliveryAddress = request.getParameter("deliveryAddress");
			
			 HttpSession session = request.getSession();
		        Account a = (Account) session.getAttribute("acc");
		        if(a == null) {
		        	response.sendRedirect("login");
		        	return;
		        }
		        int maAccount = a.getMaAccount();
		        DAO dao = new DAO();
		        List<GioHang> list = dao.getGioHangBymaAccount(maAccount);
		        List<XeMay> list2 = dao.getAllXeMay();
					
		        double totalMoney=0;
		        for(GioHang c : list) {
					for(XeMay p : list2) {
						if(c.getMaXe()==p.getMaXe()) {
							totalMoney=totalMoney+(p.getGiaTien()*c.getSoLuong());
						}
					}
				}
		        double totalMoneyVAT=totalMoney;
		        
		        
		        //old code
				Email email =new Email();
				email.setFrom("21133021@student.hcmute.edu.vn"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
				email.setFromPassword("K_Haruto1103"); //mat khau email tren
				email.setTo(emailAddress);
				email.setSubject("Đặt mua Xe thành công từ Cửa Hàng Xe Máy SPKT");
				StringBuilder sb = new StringBuilder();
				sb.append("Gửi đến ").append(name).append(",<br>");
				sb.append("Bạn vừa đặt mua Xe thành công từ Cửa Hàng Xe Máy SPKT. <br> ");
				sb.append("Địa chỉ nhận Xe của bạn là: Số 1 Võ Văn Ngân (Địa Chỉ Cửa Hàng) <b>").append(" </b> <br>");
				sb.append("Số Điện Thoại Để Xác Nhận Của Bạn Là: <b>").append(phoneNumber).append(" </b> <br>");
				sb.append("Các Xe Máy Bạn Đã Đặt Mua Là: <br>");
				for(GioHang c : list) {
					for(XeMay p : list2) {
						if(c.getMaXe()==p.getMaXe()) {
							sb.append(p.getTenXe()).append("   -|-   ").append("Giá Tiền: ").append(String.format(".0%f", p.getGiaTien()).substring(2, String.format(".0%f", p.getGiaTien()).length()-7)).append(" VNĐ").append("   -|-   ").append("Số Lượng: ").append(c.getSoLuong()).append(" chiếc<br>");
						}
					}
				}
				sb.append("Tổng Tiền: ").append(String.format("%.0f",totalMoneyVAT)).append(" đ").append("<br>");
				sb.append("Cảm ơn bạn đã tin tưởng Cửa Hàng Xe Máy SPKT,<br>");
				sb.append("Chủ Cửa Hàng");
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				request.setAttribute("mess", "Đặt hàng thành công!");
				
				dao.deleteGioHangBymaAccount(maAccount);
				
				
				//new code
//				request.setAttribute("email", emailAddress);
//				request.getRequestDispatcher("ThongTinDatHang.jsp").forward(request, response);
				
			
		} catch (Exception e) {
			request.setAttribute("error", "Đặt Hàng Thất Bại!");
			e.printStackTrace();
		}
	
		request.getRequestDispatcher("DatHang.jsp").forward(request, response);
	}

}
