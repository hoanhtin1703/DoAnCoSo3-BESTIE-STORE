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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Sửa Ảnh Quảng Cáo</h3>
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
                                <h4 class="card-title">Sua san pham</h4>
                                <form class="mt-3" method="post" action="../SuaQuangCao.php" enctype="multipart/form-data">
                                <div class="form-group">
                                    <?php 
                                
                                    $query = "SELECT * from quangcao WHERE id ='$id'";
                                    $result = mysqli_query($conn,$query);
                                    while ($data1 = mysqli_fetch_assoc($result)){
                                    ?>
                                    <input type="hidden" name="id" value="<?php echo $data1['id'];?>">
                                    <fieldset class="form-group">

                                        <img src="<?php echo $data1['hinhanh']; ?>" height="200px" width="500px" style="margin-bottom: 20px;">
                                        <input type="file" name="hinhanhsanpham" class="form-control-file" id="exampleInputFile">
                                    </fieldset>
                                    </div>
                                    
                                    <div class="form-group">
                                        <button class="btn btn-primary"> Lưu</button>
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
