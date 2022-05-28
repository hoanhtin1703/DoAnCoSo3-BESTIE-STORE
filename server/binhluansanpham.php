
<?php
include "connect.php";
$id_khachhang  = $_POST['id_khachhang'];
$id_sanpham   = $_POST['id_sanpham'];
$noidung      = $_POST['noidung'];
$result1 = array();
$result2 = array();
            $query = "INSERT INTO binhluan (id_khachhang,noidung,id_sanpham)
            VALUES ('$id_khachhang','$noidung','$id_sanpham')";
               if(mysqli_query($conn,$query)){
                $query1 = "SELECT DISTINCT id_khachhang FROM binhluan WHERE id_sanpham = '$id_sanpham'";
                $data = mysqli_query($conn,$query1);
                while ($row = mysqli_fetch_assoc($data)) {
                    $result1[] = array(
                        'id_khachhang' =>$row['id_khachhang']
                    );
               }    
               foreach ($result1 as $key => $value) {
                    $id_khachhang = $value['id_khachhang'];
                    $sql = "SELECT customer.tenkhachhang,binhluan.noidung
                    FROM binhluan
                     INNER JOIN customer ON customer.id ='$id_khachhang' AND binhluan.id_khachhang ='$id_khachhang'
                     INNER JOIN products ON  products.id ='$id_sanpham' AND binhluan.id_sanpham ='$id_sanpham'";
            $data = mysqli_query($conn,$sql);
            while($row = mysqli_fetch_assoc($data)){
                $result2[] = array(
                    'tenkhachang' =>$row['tenkhachhang'],
                     'noidung' =>$row['noidung']
                );
            }
            
        }
        if (!empty($result2)) {
                $arr = [
                    'success' => true,
                    'message' => "Thành công",
                    'result' => $result2
                ];
            } else {
                $arr = [
                    'success' => false,
                    'message' => "Thất bại!",
                    'result' => $result2
                ];
            }
        }
    
    print_r(json_encode($arr));
                
?>