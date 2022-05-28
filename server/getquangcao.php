<?php 

include "connect.php";
$sql = "SELECT hinhanh FROM quangcao ";
$result = mysqli_query($conn,$sql);
$result1 = array();
$server_name = $_SERVER['SERVER_ADDR'];
   while($row = mysqli_fetch_assoc($result))
   {
        $result1[] = array(
            // 'id' => $row['id'],
            'hinhanh' =>"http://$server_name".$row['hinhanh']
        );
   }
   if (!empty($result1)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result' => $result1
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Thất bại!",
        'result' => $result1
    ];
}
  echo json_encode($arr);
            // echo json_encode(array("value" =>"0","level" =>$level),JSON_FORCE_OBJECT); 
?>