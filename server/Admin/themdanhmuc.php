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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Thêm Danh Mục</h3>
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
                                <h4 class="card-title">Thêm Danh Mục</h4>
                                <form class="mt-3" method="post" action="../ThemDanhMuc.php" enctype="multipart/form-data">
                                <div class="form-group">
                                <fieldset class="form-group">
                                    <label class="form-control" for="">Hình Ảnh Danh Mục</label>
                                        <input type="file" name="hinhanhsanpham" class="form-control-file" id="exampleInputFile">
                                    </fieldset>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="tendanhmuc"
                                            placeholder="Tên Danh Mục">
                                        <small id="name" style="color:red;" class="form-text ">Bat Buoc</small>
                                    </div>                                  
                                    <div class="form-group">
                                        <button class="btn btn-primary">Lưu</button>
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
