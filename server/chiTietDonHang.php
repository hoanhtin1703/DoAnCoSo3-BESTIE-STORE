<?php 

include "connect.php";
// $id  = $_POST['id'];
$id_donhang = $_POST['id_donhang'];
$result5 = array();
$result2 = array(); 
$server_name = $_SERVER['SERVER_ADDR'];
     $sql1 = "SELECT masanham FROM chitietdonhang WHERE iddonhang = '$id_donhang'";
    $result = mysqli_query($conn,$sql1);                                                           
  while ($row = mysqli_fetch_assoc($result)) {
    $result5[] = array(
        'masanpham' =>$row['masanham']);
}
foreach ($result5 as $key => $value) {
    $id_sanpham =$value['masanpham'];
     $sql = "SELECT * 
     FROM chitietdonhang
     INNER JOIN donhang ON donhang.id = '$id_donhang' AND chitietdonhang.iddonhang ='$id_donhang'
     INNER JOIN products ON chitietdonhang.masanham = '$id_sanpham' AND products.id = '$id_sanpham' ";
    $result1 = mysqli_query($conn,$sql);
    while($row1 = mysqli_fetch_assoc($result1)){ 
        $result2[] = array(
            'id' =>$row1['id'],
            'iddonhang' =>$row1['iddonhang'],
            'madonhang'=>$row1['madonhang'],
            'tensanpham'=>$row1['tensanpham'],
            'giasanpham'=>$row1['giasanpham'],
            'soluongsanpham'=>$row1['soluongsanpham'],
            'trangthai'=>$row1['trangthai'],
            'hinhanhsanpham'=>"http://$server_name".$row1['hinhanhsanpham']
        );
    }
}

// $arr = [
//     'success' => true,
//     'message' => "Thành công",
//     'result' => $result2
// ];
// print_r(json_encode($arr));
echo '<pre>';print_r($result2);echo'</pre>';
?>