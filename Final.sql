
-- CreateTable
CREATE TABLE `course` (
    `course_id` CHAR(10) NOT NULL,
    `title` TEXT NULL,

    PRIMARY KEY (`course_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `instructor` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `password` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `student` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `password` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`, `name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `takes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course_id` BIGINT NULL,
    `title` TEXT NULL,
    `student_id` BIGINT NULL,
    `student_name` VARCHAR(30) NOT NULL,

    INDEX `student_id`(`student_id`, `student_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `teaches` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course_id` BIGINT NULL,
    `instructor_id` BIGINT NULL,

    INDEX `instructor_id`(`instructor_id`),
    UNIQUE INDEX `id`(`id`, `course_id`, `instructor_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `takes` ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`student_id`, `student_name`) REFERENCES `student`(`id`, `name`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `teaches` ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE `course` DROP PRIMARY KEY,
    MODIFY `course_id` BIGINT NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`course_id`);
    
-- Inserting values
INSERT INTO course(course_id, title)
VALUES (101, 'Intro to Computer Science'),
(102, 'Calculus I'),
(103, 'English Composition');

INSERT INTO instructor(id, name, password)
VALUES ('201', 'David Brown', 'popi123'),
(202, 'Karen White', 'runalone543'),
(203, 'Steven Lee', 'inolo090');

INSERT INTO student(id, name, password)
VALUES (101, 'John Smith', 'Comcat57'),
(102, 'Jane Doe', 'Matlib32'),
(103, 'Alice Johnson', 'Englob29')

INSERT INTO takes(id, course_id, title, student_id, student_name)
VALUES (910, 102, 'Calculus I', 101, 'John Smith'),
(920, 102, 'Calculus I', 102, 'Jane Doe'),
(921, 103, 'English Composition', 103, 'Alice Johnson')

INSERT INTO teches (id, course_id, instructor_id)



