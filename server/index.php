<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="chiTietDonHang.php" method="post">
  
       
        <input name="id_donhang">
       <?php
       echo date("d/m/Y");
       ?>
        <button>them</button>
    </form>
</body>
</html>