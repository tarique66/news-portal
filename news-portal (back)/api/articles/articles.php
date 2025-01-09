<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS'); 
header('Access-Control-Allow-Headers: Content-Type, Authorization'); 

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    
    http_response_code(200);
    exit();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_portal";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        if (isset($_GET['id'])) {
            $id = intval($_GET['id']);
            $sql = "SELECT articles.*, categories.name as category_name FROM articles 
                    JOIN categories ON articles.category_id = categories.id 
                    WHERE articles.id = $id";
            $result = $conn->query($sql);
            $article = $result->fetch_assoc();
            echo json_encode($article);
        } else {
            $sql = "SELECT articles.*, categories.name as category_name FROM articles 
                    JOIN categories ON articles.category_id = categories.id";
            $result = $conn->query($sql);
            $articles = array();
            while ($row = $result->fetch_assoc()) {
                $articles[] = $row;
            }
            echo json_encode($articles);
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);
        $title = $conn->real_escape_string($data['title']);
        $content = $conn->real_escape_string($data['content']);
        $author_id = intval($data['author_id']);
        $category_id = intval($data['category_id']);
        $image_url = $conn->real_escape_string($data['image_url']);
        $publish_date = $conn->real_escape_string($data['publish_date']);

        $sql = "INSERT INTO articles (title, content, author_id, category_id, image_url, publish_date) 
                VALUES ('$title', '$content', '$author_id', '$category_id', '$image_url', '$publish_date')";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Article created successfully"]);
        } else {
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"), true);
        $id = intval($data['id']);
        $title = $conn->real_escape_string($data['title']);
        $content = $conn->real_escape_string($data['content']);
        $author_id = intval($data['author_id']);
        $category_id = intval($data['category_id']);
        $image_url = $conn->real_escape_string($data['image_url']);
        $publish_date = $conn->real_escape_string($data['publish_date']);

        $sql = "UPDATE articles SET title='$title', content='$content', author_id='$author_id', 
                category_id='$category_id', image_url='$image_url', publish_date='$publish_date' 
                WHERE id=$id";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Article updated successfully"]);
        } else {
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    case 'DELETE':
        $id = intval($_GET['id']);
        $sql = "DELETE FROM articles WHERE id=$id";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Article deleted successfully"]);
        } else {
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(["message" => "Method not allowed"]);
        break;
}

$conn->close();
?>