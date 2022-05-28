<?php 

require_once "session.php";
Session::init();
include "connect.php";

    $id = $_GET['id'];
    $query = "DELETE FROM quangcao WHERE id='$id' ";
        if ( mysqli_query($conn, $query) ){
            $alert = "Đã xóa thành công";
            Session::set("thongbao",$alert);
                echo '<script>location.href ="./Admin/quanlyquangcao.php"</script>';
        }
?>