<?php 
require_once "session.php";
Session::init();
include "connect.php";

$id = $_POST['id'];
$tensp   = $_POST['tenloaisanpham'];

    $query = "UPDATE loaisanpham SET 
                                tenloaisanpham='$tensp'
                            
                                WHERE id = '$id'";
        if ( mysqli_query($conn, $query) ){
            if ($_FILES['hinhanhsanpham']['name'] == null) {
                $result["value"] = "1";
                $result["message"] = "Success";
                $alert = "Đã thêm thành công";
                Session::set("thongbao",$alert);
               echo '<script> location.href ="./Admin/quanlysanpham.php"</script>';
           
            } else {
                $permited = array('jpg','jpeg','png','gif');
                $file_name = $_FILES['hinhanhsanpham']['name'];
                $file_size = $_FILES['hinhanhsanpham']['size'];
                $file_temp = $_FILES['hinhanhsanpham']['tmp_name'];
                $div =explode('.', $file_name);
                $file_ext = strtolower(end($div));
                $unique_image = substr(md5(time()), 0,10).'.'.$file_ext;
                $path = "picture/$unique_image";
                $finalPath = "/server/".$path;
                $insert_picture = "UPDATE loaisanpham SET hinhanh='$finalPath' WHERE id='$id' ";
                if (mysqli_query($conn, $insert_picture)) {
                    if (move_uploaded_file($file_temp,$path) )
                    {
                        $alert = "Đã thêm thành công";
                         Session::set("thongbao",$alert);
                        echo '<script> location.href ="./Admin/quanlydanhmuc.php"</script>';
                    } else {
                 
                    }

                }
            }
        } 
        else {
            $response["value"] = "0";
            $response["message"] = "Error! ".mysqli_error($conn);
            echo json_encode($response);
        
        }

?>