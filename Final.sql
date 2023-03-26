
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

ALTER TABLE student ADD COLUMN email varchar(30) UNIQUE;
ALTER TABLE instructor ADD COLUMN email varchar(30) UNIQUE;
