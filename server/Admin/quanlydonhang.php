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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Đơn Hàng Mới</h3>
                    </div>
                    <div class="col-5 align-self-center">
                       
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
                                                $sql1 = "SELECT donhang.id,donhang.madonhang,donhang.trangthai,customer.tenkhachhang,donhang.date FROM donhang
                                                INNER JOIN customer ON customer.id = '$id_khachhang' AND donhang.idkhachhang='$id_khachhang'
                                                ORDER BY donhang.trangthai  ASC  ";
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
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <?php
require_once 'inc/footer.php';
            ?>
 