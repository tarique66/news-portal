<?php
session_start();
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    echo json_encode([
        "success" => true,
        "message" => "Session valid",
        "user" => [
            "id" => $_SESSION['user_id'],
            "username" => $_SESSION['username'],
            "role" => $_SESSION['role']
        ]
    ]);
} else {
    http_response_code(401);
    echo json_encode([
        "success" => false,
        "message" => "Session expired or invalid"
    ]);
}
?>