<?php
include "connect.php";
$name_user  = filterRequest("name_user");
$password_user  = filterRequest("password_user");
$stmt=$con->prepare("SELECT * FROM user WHERE `name_user`=? AND   `password_user`=? ");
$stmt->execute(array($name_user , $password_user));
$sql= $stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();
if ($count>0){
echo  json_encode(array("status"=>"success"));

}
else{
    echo json_encode(array("status"=>"fail"));
}
?> 
