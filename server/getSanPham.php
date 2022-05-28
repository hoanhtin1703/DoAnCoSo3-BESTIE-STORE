<?php
	include "connect.php";
	$query = "SELECT * FROM products ORDER BY RAND() ";
	$data = mysqli_query($conn, $query);
	$result = array();
	$server_name = $_SERVER['SERVER_ADDR'];
	while ($row = mysqli_fetch_assoc($data)) {
		$result[ ] = array(
			'id' =>$row['id'],
			'tensanpham' =>$row['tensanpham'],
			'giasanpham'=>$row['giasanpham'],
			'motasanpham'    =>$row['motasanpham'],
			'hinhanhsanpham'   =>"http://$server_name".$row['hinhanhsanpham']
			) ;
		//code...
	}
	if (!empty($result)) {
		$arr = [
			'success' => true,
			'message' => "Thành công",
			'result' => $result
		];
	} else {
		$arr = [
			'success' => false,
			'message' => "Thất bại!",
			'result' => $result
		];
	}

	print_r(json_encode($arr));
?>