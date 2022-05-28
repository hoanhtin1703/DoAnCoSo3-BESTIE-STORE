<?php 
require_once "session.php";
Session::init();
include "connect.php";
// $id  = $_POST['id'];
$server_name = $_SERVER['SERVER_ADDR'];
$hinhanh = $_FILES['hinhanh'];
$query = "INSERT INTO quangcao(hinhanh) VALUES ('$hinhanh')";
            if (mysqli_query($conn, $query) ){
                if ($hinhanh == ""){
                    $finalPath = "/server/picture/noimage.png"; 
                } else {
                    $id = mysqli_insert_id($conn);
                    $permited = array('jpg','jpeg','png','gif');
                    $file_name = $_FILES['hinhanh']['name'];
                    $file_size = $_FILES['hinhanh']['size'];
                    $file_temp = $_FILES['hinhanh']['tmp_name'];
                    $div =explode('.', $file_name);
                    $file_ext = strtolower(end($div));
                    $unique_image = substr(md5(time()), 0,10).'.'.$file_ext;
                    $path = "picture/$unique_image";
                    $finalPath = "/server/".$path;
                    $insert_picture = "UPDATE quangcao SET hinhanh='$finalPath' WHERE id='$id' ";
                    if (mysqli_query($conn, $insert_picture)) {
              
                        if (move_uploaded_file($file_temp,$path) )
                        {
                            $alert = "Đã thêm thành công";
                             Session::set("thongbao",$alert);
                            echo '<script> location.href ="./Admin/quanlyquangcao.php"</script>';
                        } else {
                     
                        }
                    }
                }
            } 
           
?>