<?php
include "connect.php";
$stmt = $con->prepare("DELETE FROM `categories` WHERE  id_Categories=? ");
$stmt->execute(array(4));
$count=$stmt->rowCount();
if ($count>0){
echo  "success ";

}
else{
    echo "fail";
}


?>