

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Chỉnh Sửa <b>Xe Máy</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Thông Tin Xe</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
      						 <div class="form-group">
           <!--                          <label>Mã Xe</label> -->
                                    <input value="${detail.maXe}" name="maXe" type="hidden" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Tên Xe</label>
                                    <input value="${detail.tenXe}" name="tenXe" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Hình Ảnh 1</label>
                                    <input value="${detail.hinhAnh1}" name="hinhAnh1" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Hình Ảnh 2</label>
                                    <input value="${detail.hinhAnh2}" name="hinhAnh2" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Hình Ảnh 3</label>
                                    <input value="${detail.hinhAnh3}" name="hinhAnh3" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Hình Ảnh 4</label>
                                    <input value="${detail.hinhAnh4}" name="hinhAnh4" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Giá Tiền</label>
                                    <input min = "1" value="${String.format("%.0f",detail.giaTien) }" name="giaTien" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required>${detail.title}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Giới Thiệu</label>
                                    <textarea name="gioiThieu" class="form-control" required>${detail.gioiThieu}</textarea>
                                </div>
                                
                                  <div class="form-group">
                                    <label>Khối Lượng</label>
                                    <textarea name="khoiLuong" class="form-control" required>${detail.khoiLuong}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Dài x Rộng x Cao</label>
                                    <textarea name="daixRongxCao" class="form-control" required>${detail.daiRongCao}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Dung Tích Xi Lanh</label>
                                    <textarea name="dungTichXiLanh" class="form-control" required>${detail.dungTichXiLanh}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Tỉ Số Nén</label>
                                    <textarea name="tiSoNen" class="form-control" >${detail.tiSoNen}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Dung Tích Bình Xăng</label>
                                    <textarea name="dungTichBinhXang" class="form-control" >${detail.dungTichBinhXang}</textarea>
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
                                 <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>