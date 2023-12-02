CREATE TABLE `teacher` (
  `teacher_id` integer PRIMARY KEY,
  `name` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `student` (
  `student_id` integer PRIMARY KEY,
  `student_name` varchar(255),
  `student_email` varchar(255)
);

CREATE TABLE `course` (
  `course_id` integer PRIMARY KEY,
  `name` varchar(255),
  `teacher_id` integer
);

CREATE TABLE `enroled_course` (
  `enroled_course_id` integer PRIMARY KEY,
  `course_id` integer,
  `student_id` integer
);

CREATE TABLE `attendance` (
  `attendance_id` integer PRIMARY KEY,
  `session_id` integer,
  `student_id` integer,
  `is_present` boolean
);

CREATE TABLE `session` (
  `session_id` integer PRIMARY KEY,
  `course_id` integer,
  `session_nb` integer,
  `session_date` date
);

CREATE TABLE `qr_code` (
  `qr_code_id` integer PRIMARY KEY,
  `server_timestamp` timestamp,
  `session_id` integer,
  `random_code` varchar(255)
);

CREATE TABLE `client_info` (
  `client_infoid` integer PRIMARY KEY,
  `azure_timestamp` timestamp,
  `session_id` integer,
  `student_id` integer,
  `random_code` varchar(255)
);

ALTER TABLE `course` ADD FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);

ALTER TABLE `course` ADD FOREIGN KEY (`course_id`) REFERENCES `enroled_course` (`course_id`);

ALTER TABLE `student` ADD FOREIGN KEY (`student_id`) REFERENCES `enroled_course` (`student_id`);

ALTER TABLE `attendance` ADD FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`);

ALTER TABLE `student` ADD FOREIGN KEY (`student_id`) REFERENCES `attendance` (`student_id`);

ALTER TABLE `session` ADD FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

ALTER TABLE `qr_code` ADD FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`);

ALTER TABLE `client_info` ADD FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`);

ALTER TABLE `client_info` ADD FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
