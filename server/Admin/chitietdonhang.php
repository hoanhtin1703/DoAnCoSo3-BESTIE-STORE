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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Chi Tiết Đơn Hàng</h3>
                    </div>
                    <div class="col-5 align-self-center">
                        <!-- <div class="customize-input float-right">
                            <a href="themsanpham.php" class="btn btn-success form-control border-0 custom-shadow custom-radius">Them San Pham</a>
                          
                        </div> -->
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
                      
                           

                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Bảng Chi Tiết Đơn Hàng</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table  mb-0"  id ="Table1">
                                        <thead>
                                            <tr class="border-0">
                                            <th class="border-0 font-14 font-weight-medium text-center text-muted">STT
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted ">Mã Đơn Hàng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Hình Ảnh Sản Phẩm
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Tên Sản Phẩm
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Đơn Giá 
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Số Lượng
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Thành Tiền
                                                </th>
                                                <!-- <th class="border-0 font-14 font-weight-medium text-center text-muted ">Tên Khách Hàng
                                                </th> -->
                                                <th class="border-0 font-14 font-weight-medium text-center text-muted">Trạng Thái</th>
                                               
                                                <!-- <th class="border-0 font-14 font-weight-medium text-muted text-center">
                                                    Chức năng
                                                </th> -->
                                               
                                            </tr>
                                        </thead>
                                        <?php
                                        $total =0;
                                        $i = 0;
                                        $id_donhang = $_GET['id_donhang'];
                                        $result5 = array();
                                        $result2 = array(); 
                                             $sql1 = "SELECT masanham FROM chitietdonhang WHERE iddonhang = '$id_donhang'";
                                            $result = mysqli_query($conn,$sql1);                                                           
                                          while ($row = mysqli_fetch_assoc($result)) {
                                            $result5[] = array(
                                                'masanpham' =>$row['masanham']);
                                        }
                                        foreach ($result5 as $key => $value) {
                                            $id_sanpham =$value['masanpham'];
                                             $sql = "SELECT * 
                                             FROM chitietdonhang
                                             INNER JOIN donhang ON donhang.id = '$id_donhang' AND chitietdonhang.iddonhang ='$id_donhang'
                                             INNER JOIN products ON chitietdonhang.masanham = '$id_sanpham' AND products.id = '$id_sanpham'
                                            ";
                                            $result1 = mysqli_query($conn,$sql);
                                            while($row1 = mysqli_fetch_assoc($result1)){ 
                                                $result2[] = array(
                                                    'id' =>$row1['id'],
                                                    'iddonhang' =>$row1['iddonhang'],
                                                    'madonhang'=>$row1['madonhang'],
                                                    'tensanpham'=>$row1['tensanpham'],
                                                    'giasanpham'=>$row1['giasanpham'],
                                                    'soluongsanpham'=>$row1['soluongsanpham'],
                                                    'trangthai'=>$row1['trangthai'],
                                                    'hinhanhsanpham'=>$row1['hinhanhsanpham']
                                                );
                                            }
                                        }
                                     
                                      foreach ($result2 as $key => $data) {
                                        $i++;
                                        $tongtien = $data['soluongsanpham']*$data['giasanpham'];
                                        $total+=$tongtien;
                                          
                                        ?>
                                          <tr>
                                          <td class="border-top-0 text-muted text-center px-2 py-4 font-14"><?php echo $i; ?></td>
                                          <td class="border-top-0 px-2 py-4 text-center"> <?php echo $data['madonhang'] ?></td>
                                          <td class="border-top-0 px-2 py-4">
                                                    <div class="d-flex no-block align-items-center">
                                                        <div class="mr-3"><img
                                                                src="<?php echo $data['hinhanhsanpham'];?>"
                                                                alt="user" class="rounded-circle" width="100"
                                                                height="100" /></div>
                                                    </div>
                                                </td>
                                                <td class="border-top-0 px-2 py-4 text-center"> <?php echo $data['tensanpham'] ;?></td>
                                                <td class="border-top-0 px-2 py-4 text-center"> <?php echo number_format($data['giasanpham'],0).'đ'; ?></td>
                                                <td class="border-top-0 px-2 py-4 text-center"> <?php echo $data['soluongsanpham'] ;?></td>
                                                <td class="border-top-0 px-2 py-4 text-center"> <?php echo number_format($data['soluongsanpham']* $data['giasanpham'],0).'đ'; ?></td>
                                                <!-- <td class="border-top-0 text-muted  text-center px-2 py-4 font-14"><?php echo $data['tenkhachhang']; ?></td> -->
                                             
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
                                            </tr>
                                        <?php
                                        }?>
                                        <?php
                                        if($_GET['trangthai']==0)
                                        {
                                        ?>
                                          <tr>
                                      
                                            <a href="../DuyetDonHang.php?id_donhang=<?php echo $id_donhang;?>&trangthai=<?php echo $_GET['trangthai'];?>&tongtien=<?php echo $total;?>" class="btn btn-primary">Duyệt Đơn Hàng</a>
                                           
                                        </tr>
                                        <?php
                                        }else{
                                        ?>
                                          <tr>
                                            <a href="../DuyetDonHang.php?id_donhang=<?php echo $id_donhang;?>&trangthai=<?php echo $_GET['trangthai'];?>&tongtien=<?php echo $total;?>" class="btn btn-danger">Hủy Duyệt Đơn Hàng</a>
                                        </tr>
                                        <?php
                                        }
                                        ?>
                                    
                                        
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
 