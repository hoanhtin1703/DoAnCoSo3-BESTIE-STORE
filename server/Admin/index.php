<?php
include "../connect.php";
require_once 'inc/header.php';
require_once 'inc/menu.php'
?>

<div class="page-wrapper">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Thống Kê</h3>
                      
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
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body" style="background-color: #ff4f70 ;">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                    <?php
                                        $query = "SELECT COUNT(*) AS tongsokhachhang FROM customer";
                                        if(mysqli_query($conn,$query)){
                                            $data = mysqli_fetch_assoc(mysqli_query($conn,$query));
                                       
                                        $tongsokhachhang = $data['tongsokhachhang'];
                                        ?>
                                          <h2 class="text-dark mb-1 font-weight-medium"><?php echo $tongsokhachhang; ?></h2>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <h6 class="text-dark font-weight-normal mb-0 w-100 text-truncate">Khách Hàng</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-dark"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body" style="background-color: #22ca80;">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                <?php
                                        $query = "SELECT tongtien FROM doanhthu";
                                        if(mysqli_query($conn,$query)){
                                            $data = mysqli_fetch_assoc(mysqli_query($conn,$query));
                                       
                                        $tongdoanhthu = $data['tongtien'];
                                        ?>
                                          <h2 class="text-dark mb-1 text-truncate  font-weight-medium"> <?php echo number_format($tongdoanhthu,0).'vnđ'; ?></h2>
                                        <?php
                                        }
                                        ?>
                                    
                                    <h6 class="text-dark font-weight-normal mb-0 w-100 text-truncate">Tổng Doanh Thu
                                    </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-dark"><i data-feather="dollar-sign"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body" style="background-color:#5f76e8 ;">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <?php
                                        $query = "SELECT COUNT(*) AS tongsanpham FROM products";
                                        if(mysqli_query($conn,$query)){
                                            $data = mysqli_fetch_assoc(mysqli_query($conn,$query));
                                       
                                        $tongsosanpham = $data['tongsanpham'];
                                        ?>
                                          <h2 class="text-dark mb-1 font-weight-medium"><?php echo $tongsosanpham; ?></h2>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <h6 class="text-dark font-weight-normal mb-0 w-100 text-truncate">Sản Phẩm</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-dark"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
                <!-- *************************************************************** -->
                <!-- End First Cards -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
              
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                      
                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Đơn Hàng Mới </h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table  mb-0"  id ="Table1">
                                        <thead>
                                            <tr class="border-0">
                                            <th class="border-0 font-14 font-weight-medium text-center text-muted">STT
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Tên Khách Hàng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted ">Mã Đơn Hàng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted ">Ngày đặt hàng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Trạng Thái</th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Hình Thức Thanh Toán</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted text-center">
                                                    Chức năng
                                                </th>
                                               
                                            </tr>
                                        </thead>
                                        <?php
                                        $i = 0;
                                        $sql = "SELECT DISTINCT idkhachhang FROM donhang ";
                                            $result4 = array();
                                            $result5 = array();
                                            $result3 = mysqli_query($conn,$sql);
                                            while($row = mysqli_fetch_assoc($result3)){
                                                $result4[] = array(
                                                    'id_khachhang' =>$row['idkhachhang']);
                                            }
                                            foreach ($result4 as $value) {
                                                $id_khachhang = $value['id_khachhang'];
                                                $sql1 = "SELECT donhang.id,donhang.madonhang,donhang.trangthai,customer.tenkhachhang,donhang.date
                                                FROM donhang
                                                INNER JOIN customer ON customer.id = '$id_khachhang' AND donhang.idkhachhang='$id_khachhang'
                                       WHERE donhang.trangthai=0  ";
                                                $result = mysqli_query($conn,$sql1);                                                           
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                $result5[] = ($row);
                                            }
                                            }
                                      foreach ($result5 as $key => $data) {
                                        
                                          $i++;
                                        ?>
                                          <tr>
                                          <td class="border-top-0 text-muted text-center px-2 py-4 font-14"><?php echo $i; ?></td>
                                               
                                                <td class="border-top-0 text-muted  text-center px-2 py-4 font-14"><?php echo $data['tenkhachhang'] ?></td>
                                                <td class="border-top-0 px-2 py-4 text-center"><?php echo $data['madonhang'] ?></td>
                                                <td class="border-top-0 px-2 py-4 text-center"><?php echo $data['date'] ?></td>
                                                <?php
                                                if($data['trangthai'] ==1)
                                                {
                                                ?>
                                                <td style="color: green ;" class="border-top-0 text-center px-2 py-4"> Đã Duyệt</td>
                                                <?php
                                                
                                      }else {

                                      
                                      ?>
                                        <td  style="color:red ;" class="border-top-0 text-center px-2 py-4"> Đang Đợi Duyệt</td>
                                      <?php 
                                      }
                                      ?>
                                                <td class="border-top-0 text-center px-2 py-4"> Tiền Mặt</td>
                                                <!-- <td class="border-top-0 text-center px-2 py-4"> <?php echo $data['tenkhachhang'] ?></td> -->
                                                <td class="font-weight-medium text-dark text-center border-top-0 px-2 py-4"> <a href="chitietdonhang.php?id_donhang=<?php echo $data['id'];?>&trangthai=<?php echo $data['trangthai']?>" class="btn btn-primary">Xem Chi Tiết</a>
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
                <!-- End Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
               
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <?php
require_once 'inc/footer.php'
?>