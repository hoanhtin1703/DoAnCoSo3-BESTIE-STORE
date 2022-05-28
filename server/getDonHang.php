<?php 

include "connect.php";
$id  = $_POST['id'];
$idkhachhang = $_POST['id_khachhang'];
$sql = "SELECT DISTINCT idkhachhang FROM donhang ";
$result4 = array();
$result5 = array();
$result3 = mysqli_query($conn,$sql);
while($row = mysqli_fetch_assoc($result3)){
    $result4[] = array(
        'id_khachhang' =>$row['idkhachhang']);
}
foreach ($result4 as $value) {
    $id_khachhang = $value['id_khachhang'];
     $sql1 = "SELECT donhang.id,donhang.madonhang,donhang.trangthai,customer.tenkhachhang FROM donhang
     INNER JOIN customer ON customer.id = '$id_khachhang' AND donhang.idkhachhang='$id_khachhang'";
    $result = mysqli_query($conn,$sql1);                                                           
  while ($row = mysqli_fetch_assoc($result)) {
    $result5[] = ($row);
}
}
// foreach ($result5 as $key => $value) {
//     $id_sanpham =$value['masanpham'];
//      $sql = "SELECT * 
//      FROM chitietdonhang
//      INNER JOIN donhang ON donhang.id = '$id_donhang' AND chitietdonhang.iddonhang ='$id_donhang'
//      INNER JOIN products ON chitietdonhang.masanham = '$id_sanpham' AND products.id = '$id_sanpham' ";
//     $result1 = mysqli_query($conn,$sql);
//     while($row1 = mysqli_fetch_assoc($result1)){ 
//         $result2[] = array(
//             'id' =>$row1['id'],
//             'iddonhang' =>$row1['iddonhang'],
//             'madonhang'=>$row1['madonhang'],
//             'tensanpham'=>$row1['tensanpham'],
//             'giasanpham'=>$row1['giasanpham'],
//             'soluongsanpham'=>$row1['soluongsanpham'],
//             'trangthai'=>$row1['trangthai'],
//             'hinhanhsanpham'=>$row1['hinhanhsanpham']
//         );
//     }
// }
// }
// $arr = [
//     'success' => true,
//     'message' => "Thành công",
//     'result' => $result2
// ];
// print_r(json_encode($arr));
echo '<pre>';print_r($result5);echo '</pre>';
?>