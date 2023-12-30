<?PHP
include "connect.php";
$stmt = $con->prepare("SELECT * FROM `categories` ");
$stmt->execute();
$bb=$stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($bb);



?>