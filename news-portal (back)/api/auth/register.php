<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");


error_log("Request Method: " . $_SERVER['REQUEST_METHOD']);
$rawInput = file_get_contents("php://input");
error_log("Raw Input: " . $rawInput);

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

$host = "localhost";
$username = "root";
$password = "";
$database = "news_portal";

$conn = new mysqli($host, $username, $password, $database);

try {
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }

    $data = json_decode($rawInput);
    
    
    error_log("Decoded data: " . print_r($data, true));

    
    if (!$data || !isset($data->firstName) || !isset($data->lastName) || 
        !isset($data->username) || !isset($data->email) || !isset($data->password)) {
        throw new Exception("Missing required fields");
    }

    
    error_log("Checking for existing user...");
    
    $check_sql = "SELECT id FROM users WHERE username = ? OR email = ?";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("ss", $data->username, $data->email);
    $check_stmt->execute();
    $result = $check_stmt->get_result();
    
    if ($result->num_rows > 0) {
        throw new Exception("Username or email already exists");
    }

    $hashedPassword = password_hash($data->password, PASSWORD_DEFAULT);
    $role = "user";
    
    
    error_log("Attempting to insert new user...");
    
    $sql = "INSERT INTO users (first_name, last_name, username, email, password, role) 
            VALUES (?, ?, ?, ?, ?, ?)";
            
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", 
        $data->firstName,
        $data->lastName,
        $data->username,
        $data->email,
        $hashedPassword,
        $role
    );
    
    if ($stmt->execute()) {
        error_log("User registered successfully");
        echo json_encode([
            "success" => true,
            "message" => "Registration successful"
        ]);
    } else {
        throw new Exception("Registration failed: " . $conn->error);
    }

} catch (Exception $e) {
    error_log("Error occurred: " . $e->getMessage());
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}

$conn->close();
?>