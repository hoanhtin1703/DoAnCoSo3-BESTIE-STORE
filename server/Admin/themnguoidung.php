<?php

include "../connect.php";

require_once 'inc/header.php';
require_once 'inc/menu.php';
?>
<div class="page-wrapper">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Thêm Khách Hàng</h3>
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
                                <h4 class="card-title">Thêm Người Dùng</h4>
                                <form class="mt-3" method="post" action="../ThemNguoiDung.php" enctype="multipart/form-data">
                               
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="tennguoidung"
                                            placeholder="Tên Khách Hàng" required>
                                        <small id="name" style="color:red;" class="form-text ">bắt buộc</small>
                                    </div>
                                    <div class="form-group">
                                       
                                        <input type="email" class="form-control" id="nametext" name="email"
                                            placeholder="Địa Chỉ Email" required>
                                        <small id="name" style="color:red;" class="form-text ">bắt buộc</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="password"
                                            placeholder="Password" required>
                                        <small id="name" style="color:red;" class="form-text">bắt buộc</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="phone"
                                            placeholder="Số Điện Thoại" required>
                                        <small id="name" style="color:red;" class="form-text">bắt buộc</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="address"
                                            placeholder="Địa Chỉ" required>
                                        <small id="name" style="color:red;" class="form-text">bắt buộc</small>
                                    </div>
                                   
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary"> Lưu</button>
                                    </div>
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
