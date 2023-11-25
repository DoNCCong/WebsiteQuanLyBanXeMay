<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
	
  <div class="list-group list-group-flush mx-3 mt-4">
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px;font-size:24px;width:300px;">
    <div style="width:100%;height:150px;background-color:black;">
    <div class="position-sticky">
      	</div>
      	<img src="./images/motobike_admin.jpg" width="200" height="200" style="margin-bottom: 10px;margin-left:40px;margin-top:40px;;border-radius: 50%;"></img>
        <a href="admin" class="list-group-item list-group-item-action py-2 ripple" aria-current="true" style="margin-top: 20px;margin-bottom: 10px;height:50px; box-shadow: 10px 2px orange;" onmouseover="this.style.color='orange'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
        </a>
        <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #c915ee;" onmouseover="this.style.color='#c915ee'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>Danh thu Thứ</span>
        </a>
         <a href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #2285f5;" onmouseover="this.style.color='#2285f5'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu Tháng</span>
        </a>
        <a href="hoaDon" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #7810f6;" onmouseover="this.style.color='#7810f6'" onmouseout="this.style.color='#49494a';">
        <i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Hóa Đơn</span>
        </a>
       
         <a href="managerAccount" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #10f51c;" onmouseover="this.style.color='#10f51c'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Quản lý tài khoản</span>
        </a>
        <a href="manager" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #daea16;" onmouseover="this.style.color='#daea16'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý Xe Máy</span>
        </a>
        <a href="top10" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #ef730f;" onmouseover="this.style.color='#ef730f'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Top 10 sản phẩm</span>
        </a>
        <a href="top5khachhang" class="list-group-item list-group-item-action py-2 ripple" style="margin-bottom: 10px;height:50px; box-shadow: 10px 2px #8411f4;" onmouseover="this.style.color='orange'" onmouseout="this.style.color='#49494a';">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Top 5 khách hàng</span>
        </a>
         <div style="margin-top:70px">
         	<hr style="height:4px;width:100%;border-width:0;color:gray;background-color:black;" >
         	<span style="margin-left:90px;font-size:24px">Admin</span>
         	<img src="./images/admin.svg" width="60" height="60" style="margin-bottom: 0px;margin-left:90px"></img>
         </div>
      </div>
    </div>
  </nav>
  <!-- Sidebar -->