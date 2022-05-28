<?php

include "../connect.php";
require_once 'inc/header.php';
require_once 'inc/menu.php';
$id = $_GET['id'];
?>
<div class="page-wrapper">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Chỉnh sửa người dùng </h3>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <div class="row">
                <div class="col-12 ">
                        <div class="card">

                            <div class="card-body">
                                <h4 class="card-title">Chỉnh Sửa Người Dùng</h4>
                                <form class="mt-3" method="post" action="../ChinhSuaNguoiDung.php" enctype="multipart/form-data">
                                <div class="form-group">
                                    <?php 
                                
                                    $query = "SELECT customer.id,account.email,account.password,customer.tenkhachhang,customer.sodienthoai,customer.diachi FROM `account` INNER JOIN customer ON account.id ='$id' AND customer.id='$id'";
                                    $result = mysqli_query($conn,$query);
                                    while ($data1 = mysqli_fetch_assoc($result)){
                                    ?>
                                
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="<?php echo $data1['id'] ?>">
                                        <input type="text" class="form-control" id="nametext" value="<?php echo $data1['tenkhachhang'] ?>" name="tennguoidung"
                                            placeholder="Tên Khách Hàng" required>
                                        <small id="name" style="color:red;" class="form-text ">Tên Khách Hàng</small>
                                    </div>
                                    <div class="form-group">
                                       
                                        <input type="email" class="form-control"  value="<?php echo $data1['email'] ?>" id="nametext" name="email"
                                            placeholder="Địa Chỉ Email" required>
                                        <small id="name" style="color:red;" class="form-text ">Địa Chỉ Email</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control"  value="<?php echo $data1['password'] ?>" id="nametext" name="password"
                                            placeholder="Password" required>
                                        <small id="name" style="color:red;" class="form-text">Password</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="<?php echo $data1['sodienthoai'] ?>" id="nametext" name="phone"
                                            placeholder="Số Điện Thoại" required>
                                        <small id="name" style="color:red;" class="form-text">Số Điện Thoại</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="<?php echo $data1['diachi'] ?>" id="nametext" name="address"
                                            placeholder="Địa Chỉ" required>
                                        <small id="name" style="color:red;" class="form-text">Địa Chỉ</small>
                                    </div>
                                   
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary"> Lưu</button>
                                    </div>
                                    <?php
                                    }
                                    ?>
                                
                                </form>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <?php
require_once 'inc/footer.php';
            ?>
