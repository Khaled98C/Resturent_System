<?PHP
include "connect.php";
$stmt = $con->prepare("SELECT  `name_Categories` FROM `categories`  ");
$stmt->execute();
$bb=$stmt->fetchAll(PDO::FETCH_ASSOC);
print_r($bb);

echo $bb;



?>