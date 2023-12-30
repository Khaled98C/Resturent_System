<?php
include "connect.php";
echo "hi";
$name_user= filterRequest("name_user");
$email_user = filterRequest("email_user");
$password_user = filterRequest("password_user");

$stmt=$con->prepare("INSERT INTO `user`( `name_user`, `password_user`, `email_user`) VALUES (?,?,?)");
$stmt->execute(array($name_user,$email_user,$password_user));

$count=$stmt->rowCount();
if ($count>0){
echo  json_encode(array("status"=>"success"));

}
else{
    echo json_encode(array("status"=>"fail"));
}
?>