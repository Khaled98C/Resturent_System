<?php
include "functions.php";
//هالكود ثابت بس بغير اسم قاعدة البيانات
$dsn = "mysql:host=localhost;dbname=tr";
$user="root";;
$pass="";
//هي التعليمة لكي يتم التعرف على اللغة العربية
$option= array(
PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"

);//PDO هي الي بتتعامل مع الداتا بيز
//  الي بيتصل بقواعد البياناتpdo  Classمن object بدي عرف
//وبعدين بسند المتغيرات الي عرفتها فوق ل الاوبجيكت 
try{
    $con = new PDO($dsn,$user,$pass,$option);

    //
   // $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ATTR_ERRMODE_EXCEPTION);

}catch(PDOException $e){

    echo $e->getMessage();
}
?>


