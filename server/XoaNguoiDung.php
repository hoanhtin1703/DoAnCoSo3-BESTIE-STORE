<?php 

require_once "session.php";
Session::init();
include "connect.php";
    $id = $_GET['id'];
    $query = "DELETE FROM customer WHERE id='$id' ";
        if ( mysqli_query($conn, $query) ){
            $query1 = "DELETE FROM account WHERE id='$id'";
            if(mysqli_query($conn,$query1)){
                $alert = "Đã xóa thành công";
                Session::set("thongbao",$alert);
                    echo '<script>location.href ="./Admin/quanlynguoidung.php"</script>';
            }
           
        }
?>