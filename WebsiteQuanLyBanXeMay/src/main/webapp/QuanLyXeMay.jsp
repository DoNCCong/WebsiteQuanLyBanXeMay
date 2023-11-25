<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Xe Máy</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
       
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
  <!-- Material Design Bootstrap Ecommerce -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
  <!-- Your custom styles (optional) -->
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         
        <style>
        body {
            margin: 0;
            padding: 0;
        }
    </style>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css"><style>body {
  background-color: #fbfbfb;
}
@media (min-width: 991.98px) {
  main {
    padding-left: 240px;
  }
}

/* Sidebar */
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  padding: 58px 0 0; /* Height of navbar */
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
  width: 240px;
  z-index: 600;
}

@media (max-width: 991.98px) {
  .sidebar {
    width: 100%;
  }
}
.sidebar .active {
  border-radius: 5px;
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: 0.5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}</style>
</head>
<body>

<!--Main Navigation-->
<header>
 <jsp:include page="LeftAdmin.jsp"></jsp:include>

  
</header>
<!--Main Navigation-->

<!--Main layout-->
<main>
	<jsp:include page="Horizbar.jsp"></jsp:include>
  <div class="container pt-4">
     <!--Section: Quan Ly Xe máy-->
    <section class="mb-4" style="margin-top:100px">
      <div class="card">
        <div class="card-header py-3 row">
          <div class="col-sm-3">
          <h5 class="mb-0 text-left" id="">
            <strong>Quản lý xe máy</strong>
          </h5>
          </div>
           <div class="col-sm-9 text-right">
	           <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i></a>
	          
	          <form action="xuatExcelProductControl" method="get"> 
           			<button type="submit" class="mb-0 text-center btn btn-primary">Xuất file Excel</button> 
            	</form>   
          </div>
        </div>
        
         	<c:if test="${error!=null }">
                 <div class="alert alert-danger" role="alert">
						 ${error}
				</div>
				</c:if>
				<c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
				  	${mess}
				</div>
				</c:if>
				
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-hover text-nowrap">
              <thead>
                <tr>
                  <th scope="col">Mã Xe</th>
                  <th scope="col">Tên Xe</th>
                  <th scope="col">Hình Ảnh</th>
                  <th scope="col">Giá Tiền</th>
                  <th scope="col">Thao Tác</th>
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${listP}" var="o">
                <tr>
                   <td>${o.maXe}</td>
                    <td>${o.tenXe}</td>
                     <td>
                          <img src="${o.hinhAnh1}" style="width: 200px;height: 120px;">
                    </td>
                     <td>${String.format("%.0f",o.getGiaTien())} VNĐ</td>
                      <td>
                              <a href="loadProduct?pid=${o.maXe}"><button type="button" class="btn btn-warning"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button></a>
                              <a href="delete?pid=${o.maXe}"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>
                      </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            
            <div class="clearfix">
                    <ul class="pagination">
                    <c:if test="${tag != 1}">
                    	 	<li class="page-item"><a href="manager?index=${tag-1 }">Previous</a></li>
                    	   </c:if> 	
                    	<c:forEach begin="1" end="${endPage }" var="i">
	                        <li class="${tag==i?"page-item active":"" }"><a href="manager?index=${i }" class="page-link">${i }</a></li>  
                    	 </c:forEach>
                    	 <c:if test="${tag != endPage}">
                    	 	 <li class="page-item"><a href="manager?index=${tag+1 }" class="page-link">Next</a></li>
                    	 	   </c:if> 	
                    </ul>
                </div>
                
          </div>
        </div>
      </div>
    </section>
    <!--Section: Quan Ly Xe máy-->
  </div>
  
    
</main>

	<!-- add XeMay HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm Xe Máy</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên Xe</label>
                                <input name="tenXe" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình Ảnh 1</label>
                                <input name="hinhAnh1" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình Ảnh 2</label>
                                <input name="hinhAnh2" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình Ảnh 3</label>
                                <input name="hinhAnh3" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình Ảnh 4</label>
                                <input name="hinhAnh4" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Giá Tiền</label>
                                <input min ="1" name="giaTien" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                             <div class="form-group">
                                <label>Khối Lượng</label>
                                <input name="khoiLuong" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Dài x Rộng x Cao</label>
                                <input name="daiRongCao" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Dung Tích Xi Lanh</label>
                                <input name="dungTichXiLanh" type="text" class="form-control" >
                            </div>
                             <div class="form-group">
                                <label>Tỉ Số Nén</label>
                                <input name="tiSoNen" type="text" class="form-control" >
                            </div>
                             <div class="form-group">
                                <label>Dung Tích Bình Xăng</label>
                                <input name="dungTichBinhXang" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Giới Thiệu</label>
                                <textarea name="gioiThieu" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Danh Mục</label>
                                <select name="danhMuc" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.maDanhMuc}">${o.tenDanhMuc}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">  
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--Main layout-->
<!-- SCRIPTS -->
  <!-- JQuery -->
  <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
    <!-- MDB Ecommerce JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
 <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
    <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
  

<script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
	 <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>