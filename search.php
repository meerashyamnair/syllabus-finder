<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$host = 'localhost';
$db   = 'syllabus_db';
$user = 'root';
$pass = ''; // default for XAMPP

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['error' => 'DB connection failed']);
    exit;
}

$dept = $_GET['dept'] ?? '';
$sem  = (int)($_GET['sem'] ?? 0);

if (!$dept || !$sem) {
    echo json_encode(['error' => 'Missing parameters']);
    exit;
}

$stmt = $pdo->prepare("
    SELECT
        c.course_code,
        c.course_name,
        c.credits,
        c.course_type,
        c.is_elective
    FROM
        courses c
    JOIN
        departments d ON c.dept_id = d.dept_id
    WHERE
        d.dept_code = :dept
        AND c.semester = :sem
    ORDER BY
        c.is_elective ASC, c.course_code ASC
");

$stmt->execute([
    ':dept' => $dept,
    ':sem' => $sem
]);

echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));