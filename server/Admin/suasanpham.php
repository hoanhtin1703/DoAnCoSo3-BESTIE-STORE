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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Sua san pham</h3>
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
                                <form class="mt-3" method="post" action="../SuaSanPham.php" enctype="multipart/form-data">
                                <div class="form-group">
                                    <?php 
                                
                                    $query = "SELECT * from products WHERE id ='$id'";
                                    $result = mysqli_query($conn,$query);
                                    while ($data1 = mysqli_fetch_assoc($result)){
                                    ?>
                                    <fieldset class="form-group">
                                        <img src="<?php echo $data1['hinhanhsanpham']; ?>" height="200px" width="500px" style="margin-bottom: 20px;">
                                        <input type="file" name="hinhanhsanpham" class="form-control-file" id="exampleInputFile">
                                    </fieldset>
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="<?php echo $data1['id']; ?>">
                                        <input type="text" class="form-control" id="nametext" name="tensanpham"
                                            placeholder="Ten San Pham"  value="<?php echo $data1['tensanpham']; ?>"> 
                                        <small id="name"  style="color:red;" class="form-text ">Bat Buoc</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="giasanpham"
                                            placeholder="Gia san pham" value="<?php echo $data1['giasanpham']; ?>" >
                                        <small id="name" style="color:red;" class="form-text ">Bat Buoc</small>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="nametext" name="soluong"
                                            placeholder="Soluong"  value="<?php echo $data1['soluong']; ?>">
                                        <small id="name" style="color:red;" class="form-text">Bat Buoc</small>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="exampleFormControlSelect1">Danh muc</label>
                                      
                                        <select class="form-control" name="idsanpham" id="exampleFormControlSelect1">
                                            <?php 
                                              	$query = "SELECT * FROM loaisanpham";
                                                $result = mysqli_query($conn,$query);
                                                while($data = mysqli_fetch_assoc($result)){
                                            ?>
                                            <option
                                             <?php
                                                 if ($data['id'] == $data1['idsanpham']) {
                                                                    echo 'selected';
                                                                }
                                                 ?> value=" <?php echo $data['id'] ?> "> <?php echo $data['tenloaisanpham'] ?></option>
                                            <?php
                                             }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3"  name="motasanpham" placeholder="Mo ta san pham"><?php echo $data1['motasanpham']; ?> </textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary"> Luu</button>
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
