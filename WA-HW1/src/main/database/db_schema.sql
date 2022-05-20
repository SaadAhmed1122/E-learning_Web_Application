create database LMS OWNER postgres ENCODING = 'UTF8';

create table lms_admin
(	admin_id INT generated always as identity,
    email CHAR(128) unique not null,
	password CHAR(128) unique not null,
	
	primary key (admin_id)
);

create table lms_student 
( 	student_id INT generated always as identity, 
	name CHAR(128) not null, 
    email CHAR(128) unique not null,
	password CHAR(128) not null,
	gender CHAR(128) not null, 
    birthdate CHAR(512) not null,
	address CHAR(512), -- can be null
	approved BOOL not null, -- bool format: '1' for true & '0' for false
 
	primary key (student_id) 
);

create table lms_teacher
( 	teacher_id INT generated always as identity, 
	name CHAR(128) not null, 
    email CHAR(128) unique not null,
	password CHAR(128) not null,
	gender CHAR(128) not null, -- only 3 options available for user to choose
	address CHAR(512), -- can be null
 
	primary key (teacher_id)
);

create table lms_course
( 	course_id INT generated always as identity, 
	name CHAR(256) not null, 
    description TEXT not null,
	prerequistie TEXT, -- can be null
 
	primary key (course_id)
);

create table lms_material 
( 	material_id INT generated always as identity, 
	topic CHAR(128) not null, 
    text TEXT not null,
	img_name TEXT, -- can be null
 	img_file TEXT, -- can be null
    course_id INT not null,
    teacher_id INT not null,
 
	primary key (material_id), 
  	constraint materialFK1   
  		foreign key (course_id)  
  		references lms_course (course_id)  
  			on delete cascade
 			on update cascade,
   	constraint materialFK2  
  		foreign key (teacher_id)  
  		references lms_teacher (teacher_id)  
  			on delete no action
 			on update cascade
);

create table lms_attend 
( 	student_id INT not null, 
    course_id INT not null,
    approved BOOL not null,
 
	primary key (student_id, course_id), 
  	constraint attendFK1   
  		foreign key (student_id)  
  		references lms_student (student_id)  
  			on delete cascade
 			on update cascade,
   	constraint attendFK2  
  		foreign key (course_id)  
  		references lms_course (course_id)  
  			on delete cascade
 			on update cascade
);

create table lms_message
( 	student_id INT not null, 
    teacher_id INT not null,
    topic CHAR(128), -- can be null
    text TEXT not null,
 
	primary key (student_id, teacher_id), 
  	constraint messageFK1   
  		foreign key (student_id)  
  		references lms_student (student_id)  
  			on delete cascade
 			on update cascade,
   	constraint messageFK2  
  		foreign key (teacher_id)  
  		references lms_teacher (teacher_id)  
  			on delete cascade
 			on update cascade
);

create table lms_assign_courses
(   teacher_id INT not null,
    course_id INT not null,
 
	primary key (teacher_id, course_id), 
   	constraint assign_coursesFK1 
  		foreign key (teacher_id)  
  		references lms_teacher (teacher_id)  
  			on delete cascade
 			on update cascade,
 	constraint assign_coursesFK2
  		foreign key (course_id)  
  		references lms_course (course_id)  
  			on delete cascade
 			on update cascade
);
