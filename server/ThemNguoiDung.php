
<?php
include "connect.php";

$user_name  = $_POST['tennguoidung'];
$password   = $_POST['password'];
$email      = $_POST['email'];
$phone   = $_POST['phone'];
$address      = $_POST['address'];
$level = 1;

$query = "SELECT * FROM account WHERE email = '$email'";
$data = mysqli_query($conn,$query);
if(mysqli_num_rows($data)>0){
            //  Session::set("thongbao",$alert);
            echo '<script> alert("Email này đã có người sử dụng rồi ! Vui Lòng Nhập Địa Chỉ Email Khác") </script>';
            echo '<script> location.href ="./Admin/themnguoidung.php"</script>';
}else{
  $query = "INSERT INTO account (email,password,level)
  VALUES ('$email', '$password', '$level')";
        if(mysqli_query($conn,$query)){
          $id = mysqli_insert_id($conn);
          $sql =" INSERT INTO customer (tenkhachhang,sodienthoai,diachi,id_account)
          VALUES ('$user_name','$phone','$address', '$id') ";
          mysqli_query($conn,$sql);
          $alert = "Đã thêm thành công";
          Session::set("thongbao",$alert);
         echo '<script> location.href ="./Admin/quanlynguoidung.php"</script>';
           
         }else{
          echo json_encode(array("value" => "false",JSON_FORCE_OBJECT) );
                
        }
}
?>