
create table course(
	course_id int AUTO_INCREMENT,
	title text,
	CONSTRAINT pk_course PRIMARY KEY (course_id)
);

create table student(
	id int AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
	constraint pk_std primary key (id, name)
);

create table instructor(
	id int AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    constraint pk_ins primary key (id)
);

create table teaches(
	id int AUTO_INCREMENT PRIMARY KEY,
	course_id int,
    instructor_id INT, 
    FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
    UNIQUE(id, course_id, instructor_id)
);


create table takes(
	id int AUTO_INCREMENT PRIMARY KEY,
	course_id int,
    title text,
    student_id INT,
    student_name VARCHAR(30) NOT NULL,
    FOREIGN KEY (student_id, student_name) REFERENCES student(id, name) ON DELETE CASCADE
);

ALTER TABLE student ADD COLUMN email varchar(30) UNIQUE;
ALTER TABLE instructor ADD COLUMN email varchar(30) UNIQUE;


Insert into course values 
("MAT116","Pre-Caluculas"),
("MAT120","Calculas-I"),
("MAT130","Calculas-II"),
("MAT250","Calculas-III")

Insert into instructor values 
(451324134,"Isabella","78429561"),
(461116413,"Liam","39286745"),
(474532132,"Emilia","14872693"),
(491315644,"Ethan","97651203"),
(502354654,"Sophia","63092418")

Insert into student values
(101555654,"Harper","98342765"),
(102312324,"Miles","57461023"),
(103556456,"Jocelyn","12873594"),
(104235641,"Xavier","73986214"),
(106231546,"Savannah","46219873")
