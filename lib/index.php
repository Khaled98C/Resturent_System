<?php

include "connect.php";
//1-اول شي بعرف متغير  وبحط فيو الاوبجيكت الي استديعت منو الداتا بيز 
//2-  SQLاتستخدم لكتابة تعليمة prepare
//3-stmt-> execut() لتنفيذ التعليمة اخذ المتحول الي اسندنالو قيمة الاةبجيكت ونستخدم 
//-4 (fetch) بدي اوخذ القيم من خلال تعريف متحول جديد نسندلو المتحول القديم مع 
//5-fetch اذا بدي row and coulm واحد فقط
//6- كل البيانات fetchAll
$stmt = $con->prepare("SELECT `id_Categories`, `name_Categories`, `price_Categories`, `meal_Categories` FROM `categories` ");
$stmt->execute();
$sql= $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "<pre>";
print_r($sql);
echo "<pre>";
$count=$stmt->rowCount();

echo "<pre>";
echo json_encode($sql);


?>


