
	<?php
	include "connect.php";
	$query = "SELECT * FROM loaisanpham";
	$data = mysqli_query($conn, $query);
	$result = array();
	$server_name = $_SERVER['SERVER_ADDR'];
	while ($row = mysqli_fetch_assoc($data)) {
		$result[] = array(
			'id' => $row['id'],
			'tenloaisanpham' => $row['tenloaisanpham'],
			'hinhanh' => "http://$server_name".$row['hinhanh']
		);
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
	echo(json_encode($arr));

?>