<?php 

require_once "session.php";
Session::init();
include "connect.php";

    $id = $_GET['id_donhang'];
    $trangthai = $_GET['trangthai'];
    $tongtien = $_GET['tongtien'];
    if($trangthai == 0){
        $query = "UPDATE donhang SET trangthai=1 WHERE id='$id' ";
        if ( mysqli_query($conn, $query) ){
            $query = "SELECT tongtien FROM doanhthu";
            $result = mysqli_query($conn,$query);
            if($result){
                $data = mysqli_fetch_assoc($result);
                $tongtienhientai = $data['tongtien'];
                $tongtienmoi = $tongtien + $tongtienhientai;
                $query1 = "UPDATE doanhthu SET tongtien='$tongtienmoi'";
                if( mysqli_query($conn,$query1)){
                    $alert = "Duyệt thành công";
                    Session::set("thongbao",$alert);
                        echo '<script>location.href ="./Admin/quanlydonhang.php"</script>';
                }
            }  
        }
    }else{
        $query = "UPDATE donhang SET trangthai=0 WHERE id='$id' ";
        if ( mysqli_query($conn, $query) ){
            $query = "SELECT tongtien FROM doanhthu";
            $result = mysqli_query($conn,$query);
            if($result){
                $data = mysqli_fetch_assoc($result);
                $tongtienhientai = $data['tongtien'];
                $tongtienmoi = $tongtien - $tongtienhientai;
                $query1 = "UPDATE doanhthu SET tongtien='$tongtienmoi'";
                if( mysqli_query($conn,$query1)){
                    $alert = "Duyệt thành công";
                    Session::set("thongbao",$alert);
                        echo '<script>location.href ="./Admin/quanlydonhang.php"</script>';
                }
            }  
        }
    }
   
?>