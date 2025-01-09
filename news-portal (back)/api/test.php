<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once "./config/database.php";

$database = new Database();
$db = $database->getConnection();

if($db) {
    echo json_encode(array("message" => "Database connection successful"));
} else {
    echo json_encode(array("message" => "Database connection failed"));
}
?>