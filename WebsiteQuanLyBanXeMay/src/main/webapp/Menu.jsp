<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<html lang="vi">
	<head>
        <meta charshet="utf-8" />
    </head>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="position: fixed; top: 0; width:100%;  z-index: 100000;">
	    <div class="container">
	        <a class="navbar-brand" href="home">Cửa Hàng Xe Máy SPKT</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
	            <ul class="navbar-nav m-auto">
	            <li class="nav-item">
	                        <a class="nav-link" href="home">TRANG CHỦ</a>
	                    </li> 
	            <li class="nav-item">
	                        <a class="nav-link" href="shop">CỬA HÀNG</a>
	                    </li> 
	                
	                <c:if test="${sessionScope.acc == null}">
	                    <li class="nav-item">
	                        <a class="nav-link" href="login">ĐĂNG NHẬP</a>
	                    </li>
	                </c:if>
	                <c:if test="${sessionScope.acc == null}">
	                    <li class="nav-item">
	                        <a class="nav-link" href="forgotPassword">QUÊN MẬT KHẨU</a>
	                    </li>
	                </c:if>
	                <c:if test="${sessionScope.acc != null}">
	                    
	                    <li class="nav-item">
	                        <a class="nav-link" href="logout">ĐĂNG XUẤT</a>
	                    </li> 
	                    <li class="nav-item">
	                        <a class="nav-link" href="EditProfile.jsp">CHỈNH SỬA TÀI KHOẢN</a>
	                    </li>
	                    <li class="nav-item">
	                      <c:if test="${sessionScope.acc.username != \"admin\" }">
	                    	
	                        	<a class="nav-link" href="#">XIN CHÀO, ${sessionScope.acc.username}</a>
	                      </c:if>
	                      <c:if test="${sessionScope.acc.username == \"admin\" }">
	                        	<a class="nav-link" href="admin">XIN CHÀO, ${sessionScope.acc.username}</a>
	                     </c:if>  
	                    </li>
	                </c:if>
	            </ul>
	
	            <form action="search" method="post" class="form-inline my-2 my-lg-0">
	                
	                <a href="managerCart" style="background-color:#2A76F2; color:#FFFFFF; font:10.24px Roboto, sans-serif; margin:0px 0px 0px 16px; padding:11px 21px 10px; border-radius: 8px">
	                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">GIỎ HÀNG</span>
	                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>
	                  
	                </a>
	            </form>
	        </div>
	    </div>
	</nav>

</html>




<!--end of menu-->
