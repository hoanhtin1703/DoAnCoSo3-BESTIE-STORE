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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Quản Lý Người Dùng</h3>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <a href="themnguoidung.php" class="btn btn-success form-control border-0 custom-shadow custom-radius">Thêm Khách Hàng</a>
                          
                        </div>
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
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <?php
                                if(Session::get('thongbao')!=null) {

                                    ?>
                                     <div class="alert alert-success alert-dismissible bg-success text-white border-0 fade show"
                                    role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <?php echo Session::get('thongbao');?>
                                </div>
                                    <?php
                                }
                                    ?>
                           

                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Bảng Người Dùng</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table  mb-0"  id ="Table1">
                                        <thead>
                                            <tr class="border-0">
                                            <th class="border-0 font-14 font-weight-medium text-center">STT
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center">Địa Chỉ Email
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center ">Tên Khách Hàng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center">Số Điện Thoại</th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-center">
                                                    Địa Chỉ
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-center">
                                                    Chức năng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-muted"></th>
                                            </tr>
                                        </thead>
                                        <?php
                                        $i = 0;
                                      $query = "SELECT customer.id,account.email,customer.tenkhachhang,customer.sodienthoai,customer.diachi FROM `account` INNER JOIN customer ON account.id = customer.id" ;
                                      $result = mysqli_query($conn, $query);
                                     
                                      while ( $data = mysqli_fetch_assoc($result)){
                                         
                                          $i++;
                                        ?>
                                          <tr>
                                          <td class="border-top-0 text-center px-2 py-4 font-14"><?php echo $i; ?></td>
                                                
                                                <td class="border-top-0 text-center px-2 py-4 "><?php echo $data['email'] ?></td>
                                                <td class="border-top-0 px-2 py-4 text-center">
                                                <?php echo $data['tenkhachhang'] ?>
                                                </td>
                                                <td class="border-top-0 text-center px-2 py-4"> <?php echo $data['sodienthoai'] ?></td>
                                                <td class="border-top-0 text-center px-2 py-4"> <?php echo $data['diachi'] ?></td>
                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4"> <a href="suanguoidung.php?id=<?php echo $data['id'];?>" class="btn btn-warning">Sửa</a>
                                                </td>
                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4"> <a onclick="return confirm('Bạn có muốn xóa sản phâm này')" href="../XoaNguoiDung.php?id=<?php echo $data['id'];?>" class="btn btn-danger">Xóa</a>
                                                </td>
                                            </tr>
                                        <?php

                                        }?>
                                        <tbody>
                                          
                                          
                                        </tbody>
                                    </table>
                                </div>
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
