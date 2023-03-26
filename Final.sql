
create table course(
    course_id int AUTO_INCREMENT,
    title text,
    CONSTRAINT pk_course PRIMARY KEY (course_id)
);

create table student(
    id int AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE,
    password VARCHAR(30) NOT NULL,
    constraint pk_std primary key (id, name)
);

create table instructor(
    id int AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE,
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
