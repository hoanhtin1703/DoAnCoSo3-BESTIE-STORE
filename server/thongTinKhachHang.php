<?php
	include "connect.php";
	$madonhang  = rand();
	$date =  date("d/m/Y");
	$trangthai = 0;
	$id = $_POST['id'];

	$json = $_POST['json'];
		$data = json_decode($json, true);

		$query = "INSERT INTO donhang(madonhang, trangthai,idkhachhang,date) VALUES 
		('$madonhang','$trangthai', '$id','$date')";
		$result=mysqli_query($conn, $query);
		if($result){
			$iddonhang = $conn->insert_id;
		}
	 foreach ($data as $value) {
		$id_sanpham = $value['id_sanpham'];
		$id_khach_hang = $value['id_khachhang'];
		$tensanpham = $value['tensanpham'];
		$giasanpham = $value['giasp'];
		$soluongsanpham = $value['soluongsanpham'];
			$query1 = "INSERT INTO chitietdonhang(iddonhang,madonhang,masanham,tensanpham,giasanpham,soluongsanpham) 
			VALUES
			('$iddonhang','$madonhang','$id_sanpham','$tensanpham','$giasanpham','$soluongsanpham')";
			mysqli_query($conn,$query1);
	
	 }
		
		
?>