-- ============================================================
--  SYLLABUS SEARCHER · Full MySQL Setup Script
--  Run this in your MySQL/MariaDB instance
-- ============================================================

-- 1. Create & use database
CREATE DATABASE IF NOT EXISTS syllabus_db;
USE syllabus_db;

-- 2. Departments table
CREATE TABLE departments (
  dept_id   INT PRIMARY KEY AUTO_INCREMENT,
  dept_code VARCHAR(10) NOT NULL UNIQUE,
  dept_name VARCHAR(100) NOT NULL
);

-- 3. Courses table
CREATE TABLE courses (
  course_id   INT PRIMARY KEY AUTO_INCREMENT,
  course_code VARCHAR(15) NOT NULL,
  course_name VARCHAR(150) NOT NULL,
  dept_id     INT NOT NULL,
  semester    INT NOT NULL CHECK (semester BETWEEN 1 AND 8),
  credits     INT NOT NULL,
  course_type ENUM('Theory', 'Lab', 'Project') DEFAULT 'Theory',
  is_elective BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
--  INSERT SAMPLE DATA
-- ============================================================

INSERT INTO departments (dept_code, dept_name) VALUES
  ('CSE', 'Computer Science & Engineering'),
  ('ECE', 'Electronics & Communication'),
  ('ME',  'Mechanical Engineering'),
  ('CE',  'Civil Engineering'),
  ('EEE', 'Electrical & Electronics');

-- CSE Courses (Semester 1–3 sample)
INSERT INTO courses (course_code, course_name, dept_id, semester, credits, course_type, is_elective) VALUES
  ('24BST1101', 'Linear Algebra and Calculus',        1, 1, 4, 'Theory', FALSE),
  ('24BSE1003B', 'Analytical and Materials Chemistry ',         1, 1, 4, 'Theory', FALSE),
  ('24EST1004K', 'Basics of Computer Science and Engineering',               1, 1, 4, 'Theory', FALSE),
  ('24EST1005E', 'Introduction to Electrical and Electronics Engineering',               1, 1, 4, 'Theory',    FALSE),
  ('24HML1106', 'Effective Spoken English',                   1, 1, 1, 'Theory', FALSE),
  ('24ESE1107', 'Python Programming',                   1, 1, 1, 'Lab', FALSE),
  ('24BSTM009', 'Engineering Biology',                   1, 1, 1, 'Theory', TRUE),
  ('24HMTM008', 'Universal Human Values',                   1, 1, 1, 'Theory', TRUE),
  ('24ESL1010D', 'Electrical and Electronics Engineering Workshop',                   1, 1, 1, 'Lab', FALSE),

  ('24BSE1211A', 'Vector Calculus and Differential Equations',                   1, 2, 4, 'Theory', FALSE),
  ('24BSE1002C', 'Mordern Physics For Engineering',         1, 2, 4, 'Theory', FALSE),
  ('24EST1004A', 'Introduction to Engineering Drawing and CAD',              1, 2, 4, 'Theory', FALSE),
  ('24EST1005A', 'Basics of Mechanical and Civil Engineering',               1, 2, 4, 'Theory',    FALSE),
  ('24BSTM009', 'Engineering Biology',                   1, 2, 1, 'Theory', TRUE),
  ('24HMTM009', 'Universal Human Values',                   1, 2, 1, 'Theory', TRUE),
  ('24ESL1010A', 'Mechanical and Civil Engineering Workshop',                   1, 2, 1, 'Lab', FALSE),
  ('24ESE1212A', 'C Programming',                   1, 2, 1, 'Theory', FALSE),
  ('24ESTM051', 'Concepts of Entreprenuership and Startups',                   1, 2, 1, 'Theory', TRUE),
  ('24HMTM052', 'Essence of Indian Knowledge Tradition',                   1, 2, 1, 'Theory', TRUE),
  ('24HMTM053', 'Indian Constitutional Studies',                   1, 2, 2, 'Theory', TRUE),
  ('24CBQM054', 'Socially Relevant Community Based Project',                   1, 2, 3, 'Theory', FALSE),

  ('24BSE2113C', 'Discrete Mathematical Structures', 1, 3, 4, 'Theory', FALSE),
  ('24CSH2114', 'Object Oriented Programming using Java', 1, 3, 3, 'Theory', FALSE),
  ('24CST2115', 'Data Structures', 1, 3, 4, 'Theory', FALSE),
  ('24CST2116', 'Digital Electronics', 1, 3, 4, 'Theory', FALSE),
  ('24CSL2120', 'Data Structures Laboratory', 1, 3, 1, 'Lab', FALSE),
  ('24CSL2120', 'Digital Electronics Laboratory', 1, 3, 1, 'Lab', FALSE),
  ('24ESQ2119AA', 'Artificial Intelligence and Machine Learning', 1, 3, 1, 'Theory', TRUE),
  ('24ESQ2119AB', 'Artificial Intelligence and Data Science', 1, 3, 1, 'Theory', TRUE),
  ('24ESQ2119AC', 'Artificial Intelligence and Deep Learning', 1, 3, 1, 'Theory', TRUE),
  ('24ESTM051', 'Concepts of Entreprenuership and Startups',                   1, 3, 1, 'Theory', TRUE),
  ('24HMTM052', 'Essence of Indian Knowledge Tradition',                   1, 3, 1, 'Theory', TRUE),
  ('24HMTM053', 'Indian Constitutional Studies',                   1, 3, 2, 'Theory', TRUE),

  ('24BSE2223A', 'Probablity and Random Processes',                 1, 4, 4, 'Theory', FALSE),
  ('24CSH2224', 'Database Management Systems',                 1, 4, 5, 'Theory', FALSE),
  ('24CST2225', 'Design and Analysis of Algorithms',              1, 4, 4, 'Theory', FALSE),
  ('24CST2226', 'Computer Architecture and Organization',                 1, 4, 4, 'Theory',    FALSE),
  ('24CSL2228', 'Database Management System Laboratory',                  1, 4, 2, 'Lab', FALSE),
  ('24CSL2229', 'Advanced Programming Laboratory',                 1, 4, 1, 'Lab', FALSE),
  ('24ESTM017', 'Design Thinking in SUstainable Product Endineering',                 1, 4, 1, 'Theory', TRUE),
  ('24HMTM018', 'Professional Ethics and Life Skills',              1, 4, 1, 'Theory', TRUE),
  ('24CSTPE12A', 'Introduction to Web Programming',                 1, 4, 3, 'Theory',    TRUE),
  ('24CSTPE12B', 'Programming Methordologies',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12C', 'Mathematical Foundation for Machine Learning',                  1, 4, 4, 'Theory', TRUE),
  ('24CSTPE12D', 'Soft Computing',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12E', 'Data Communication',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12F', 'PC and Network Hardware',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12G', 'Scripting Languages for Web Devolepment',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12H', 'Software Quality Assurance',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12I', 'Basics of Machine Learning using Python',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12J', 'Computer Graphics and Images Processing',                  1, 4, 3, 'Theory', TRUE),
  ('24CSTPE12K', 'Cryptography',                  1, 4, 3, 'Theory', TRUE),
  ('24ERTPE12I', 'Mobile Computing',                  1, 4, 3, 'Theory', TRUE),
  ('24ESTM051', 'Concepts of Entreprenuership and Startups',                   1, 4, 1, 'Theory', TRUE),
  ('24HMTM052', 'Essence of Indian Knowledge Tradition',                   1, 4, 1, 'Theory', TRUE),
  ('24HMTM053', 'Indian Constitutional Studies',                   1, 4, 2, 'Theory', TRUE),

  ('20CST301', 'Formal Languages and Automata Theory',                 1, 5, 4, 'Theory', FALSE),
  ('20CST303', 'Computer Networks',                 1, 5, 4, 'Theory', FALSE),
  ('20CST305', 'System Software',              1, 5, 4, 'Theory', FALSE),
  ('20CST307', 'Microprocessors and Microcontrollers',                 1, 5, 4, 'Theory',    FALSE),
  ('20CST309', 'Management of Software Systems',                  1, 5, 3, 'Theory', FALSE),
  ('20MCN301', 'Disaster Management',                  1, 5, 0, 'Theory', TRUE),
  ('20CSL301', 'System Software and Microprocessors Lab',                  1, 5, 2, 'Lab', FALSE),
  ('20CSL303', 'Database Management System Lab',                  1, 5, 2, 'Lab', FALSE),

  ('20CST302', 'Compiler Design',                 1, 6, 4, 'Theory', FALSE),
  ('20CST304', 'Computer Graphics and Image Processing',                 1, 6, 4, 'Theory', FALSE),
  ('20CST306', 'Algorithm Analysis and Design',              1, 6, 4, 'Theory', FALSE),
  ('20CST312', 'Foundation of Machine Learning',                 1, 6, 3, 'Theory',    FALSE),
  ('20CST322', 'Data Analytics',                  1, 6, 3, 'Theory', FALSE),
  ('20CST332', 'Foundation of Security in Computing ',                  1, 6, 3, 'Theory', FALSE),
  ('20CST342', 'Automated Verification',                  1, 6, 3, 'Theory', FALSE),
  ('20CST352', 'Introduction to IA 32 Architecture',                  1, 6, 3, 'Theory', FALSE),
  ('20CST362', 'Programming in Python',                  1, 6, 3, 'Theory', FALSE),
  ('20CST372', 'Data and Computer Communication',                  1, 6, 3, 'Theory', FALSE),
  ('20HUT300', 'Industrial Economics and Foreign Trade',                  1, 6, 3, 'Theory', TRUE),
  ('20CSL302', 'Networking Lab',                  1, 6, 2, 'Lab', FALSE),
  ('20CSD302', 'Mini Project',                  1, 6, 3, 'Project', FALSE),

  ('20CST401', 'Artificial Intelligence',                 1, 7, 3, 'Theory', FALSE),
  ('20CST411', 'Machine Learning',                 1, 7, 3, 'Theory', FALSE),
  ('20CST431', 'Security in Computing',                 1, 7, 3, 'Theory', FALSE),
  ('20CST441', 'Model Based Software Devolepment',                 1, 7, 3, 'Theory', FALSE),
  ('20CST451', 'Advanced Topics in IA 32 Architecture',                 1, 7, 3, 'Theory', FALSE),
  ('20CST461', 'Web Programming',                 1, 7, 3, 'Theory', FALSE),
  ('20CST471', 'Natural Language Processing',                 1, 7, 3, 'Theory', FALSE),
  ('20CST413', 'Introduction to Mobile Computing',                 1, 7, 3, 'Theory', FALSE),
  ('20CST433', 'Computer Graphics',                 1, 7, 3, 'Theory', FALSE),
  ('20CST443', 'Python for Engineers',                 1, 7, 3, 'Theory', FALSE),
  ('20CST453', 'Object Oriented Concepts',                 1, 7, 3, 'Theory', FALSE),
  ('20CST401', 'Industry Safety Engineering',                 1, 7, 0, 'Theory', TRUE),
  ('20CSL401', 'Compiler Lab',                 1, 7, 2, 'Theory', FALSE),
  ('20CSQ401', 'Seminar',                 1, 7, 2, 'Project', FALSE),
  ('20CSD401', 'Project Phase I',                 1, 7, 2, 'Project', FALSE),

  ('20CST402', 'Distributed Computing',                 1, 8, 3, 'Theory', FALSE),
  ('20CST412', 'Deep Learning',                 1, 8, 3, 'Theory', FALSE),
  ('20CST422', 'Programming Paradigms',                 1, 8, 3, 'Theory', FALSE),
  ('20CST432', 'Cryptography',                 1, 8, 3, 'Theory', FALSE),
  ('20CST422', 'Soft Computing',                 1, 8, 3, 'Theory', FALSE),
  ('20CST452', 'Fuzzy Set Theory and Applications',                 1, 8, 3, 'Theory', FALSE),
  ('20CST462', 'Embedded Systems',                 1, 8, 3, 'Theory', FALSE),
  ('20CST472', 'Computer Vision',                 1, 8, 3, 'Theory', FALSE),
  ('20CST414', 'Formal Methords and Tools in Software Engineering',                 1, 8, 3, 'Theory', FALSE),
  ('20CST424', 'Client Server Architecture',                 1, 8, 3, 'Theory', FALSE),
  ('20CST434', 'Parellel Computing',                 1, 8, 3, 'Theory', FALSE),
  ('20CST444', 'Data Compression Technique',                 1, 8, 3, 'Theory', FALSE),
  ('20CST454', 'Unified Extended Firmware Interface',                 1, 8, 3, 'Theory', FALSE),
  ('20CST464', 'Data Mining',                 1, 8, 3, 'Theory', FALSE),

  ('24BST1101', 'Linear Algebra and Calculus',        2, 1, 4, 'Theory', FALSE),
  ('24BSE1002B', 'Applied Physics for Engineering',        2, 1, 4, 'Theory', FALSE),
  ('24EST1004J', 'Semiconductor Physics and Devices',        2, 1, 4, 'Theory', FALSE),
  ('24EST1005A', 'Basics of Mechanical and Civil Engineering',        2, 1, 4, 'Theory', FALSE),
  ('24HML1106', 'Effective Spoken English',        2, 1, 1, 'Theory', FALSE),
  ('24ESE1107', 'Python Programming',        2, 1, 1, 'Theory', FALSE),
  ('24BSTM009', 'Engineering Biology',                   2, 1, 1, 'Theory', TRUE),
  ('24HMTM008', 'Universal Human Values',                   2, 1, 1, 'Theory', TRUE),
  ('24ESL1010A', 'Mechanical and Civil Engineering Workshop',                   2, 1, 1, 'Lab', FALSE);


-- ============================================================
--  THE CORE SELECT QUERY (used in the app)
-- ============================================================
--
--  Replace 'CSE' and 3 with user inputs (use prepared statements!)
--

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
  d.dept_code = 'CSE'     -- ← parameterized input
  AND c.semester = 3       -- ← parameterized input
ORDER BY
  c.is_elective ASC, c.course_code ASC;


-- ============================================================
--  OTHER USEFUL QUERIES FOR THE PROJECT REPORT
-- ============================================================

-- Count courses per semester for a department
SELECT semester, COUNT(*) AS num_courses, SUM(credits) AS total_credits
FROM courses c
JOIN departments d ON c.dept_id = d.dept_id
WHERE d.dept_code = 'CSE'
GROUP BY semester
ORDER BY semester;

-- List all elective courses across all departments
SELECT d.dept_code, c.course_code, c.course_name, c.semester, c.credits
FROM courses c
JOIN departments d ON c.dept_id = d.dept_id
WHERE c.is_elective = TRUE
ORDER BY d.dept_code, c.semester;

-- Find courses available across multiple departments (common courses)
SELECT course_code, course_name, COUNT(DISTINCT dept_id) AS shared_by
FROM courses
GROUP BY course_code, course_name
HAVING shared_by > 1;


-- ============================================================
--  PHP BACKEND (save as search.php, put next to index.html)
--  Receives: ?dept=CSE&sem=3
--  Returns:  JSON array of courses
-- ============================================================
/*

<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$host   = 'localhost';
$db     = 'syllabus_db';
$user   = 'root';       // change to your MySQL user
$pass   = '';           // change to your MySQL password

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

// Prepared statement prevents SQL injection
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

$stmt->execute([':dept' => $dept, ':sem' => $sem]);
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($rows);

*/
