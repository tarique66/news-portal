<?php
session_start();
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");


ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

$host = "localhost";
$username = "root";
$password = "";
$database = "news_portal";
$conn = new mysqli($host, $username, $password, $database);

try {
    $data = json_decode(file_get_contents("php://input"));
    error_log("Attempting login for username: " . $data->username);

    $sql = "SELECT * FROM users WHERE username = ? LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $data->username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        error_log("No user found with username: " . $data->username);
        throw new Exception("Invalid username or password");
    }

    $user = $result->fetch_assoc();
    $loginSuccess = false;

    if ($user['role'] === 'admin') {
        $loginSuccess = ($data->password === 'admin');
    } else {
        $loginSuccess = password_verify($data->password, $user['password']);
    }

    if ($loginSuccess) {
        
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];
        $_SESSION['logged_in'] = true;
        
        error_log("Login successful for " . $user['username']);
        unset($user['password']);
        
        echo json_encode([
            "success" => true,
            "message" => "Login successful",
            "user" => $user,
            "session_id" => session_id() 
        ]);
    } else {
        error_log("Password verification failed for " . $user['username']);
        throw new Exception("Invalid username or password");
    }
} catch (Exception $e) {
    error_log("Login error: " . $e->getMessage());
    http_response_code(401);
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}

$conn->close();
?>