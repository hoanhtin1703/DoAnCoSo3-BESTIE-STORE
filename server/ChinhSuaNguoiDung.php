
<?php
require_once "session.php";
Session::init();
include "connect.php";
$id = $_POST['id'];
$user_name  = $_POST['tennguoidung'];
$password   = $_POST['password'];
$email      = $_POST['email'];
$phone   = $_POST['phone'];
$address      = $_POST['address'];

  $query = "UPDATE account SET email ='$email',password ='$password' WHERE id='$id'" ;
        if(mysqli_query($conn,$query)){
         
          $sql =" UPDATE customer SET tenkhachhang ='$user_name',sodienthoai='$phone',diachi='$address' WHERE id='$id'";
          mysqli_query($conn,$sql);
          $alert = "Đã thêm thành công";
          Session::set("thongbao",$alert);
         echo '<script> location.href ="./Admin/quanlynguoidung.php"</script>';
           
         }else{
          echo json_encode(array("value" => "false",JSON_FORCE_OBJECT) );
                
        }

?>