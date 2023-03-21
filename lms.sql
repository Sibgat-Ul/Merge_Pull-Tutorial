CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `password` VARCHAR(32) NULL,
    `role` ENUM('student', 'instructor') NULL,
    PRIMARY KEY (`id`)
)
