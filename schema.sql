CREATE DATABASE IF NOT EXISTS codneura_courses;
USE codneura_courses;

CREATE TABLE IF NOT EXISTS courses (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(150) NOT NULL,
  level VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS enrollments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrolled_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_enrollments_student
    FOREIGN KEY (student_id) REFERENCES students(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_enrollments_course
    FOREIGN KEY (course_id) REFERENCES courses(id)
    ON DELETE CASCADE,
  CONSTRAINT uq_student_course UNIQUE (student_id, course_id)
);

INSERT INTO courses (title, level) VALUES
  ('JavaScript Basics', 'beginner'),
  ('Node.js and Express', 'intermediate')
ON DUPLICATE KEY UPDATE title = VALUES(title);

INSERT INTO students (name, email) VALUES
  ('Demo Student One', 'student1@example.com'),
  ('Demo Student Two', 'student2@example.com')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT IGNORE INTO enrollments (student_id, course_id) VALUES
  (1, 1),
  (2, 2);