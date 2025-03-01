<?php
class Database {
    private $host = "localhost";
    private $db_name = "news_portal";
    private $username = "root";
    private $password = "";
    public $conn;

    public function getConnection() {
        $this->conn = null;

        try {
            $this->conn = new PDO(
                "mysql:host=" . $this->host . ";dbname=" . $this->db_name,
                $this->username,
                $this->password
            );
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo json_encode([
                "success" => false,
                "message" => "Connection error: " . $e->getMessage()
            ]);
            exit;
        }

        return $this->conn;
    }
}
?>