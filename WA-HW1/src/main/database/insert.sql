INSERT INTO lms_admin(email, password)
VALUES('TORE@admin.com', md5('myPassword'));

INSERT INTO lms_student(name, email, password, gender, birthdate, address, approved, admin_id) 
OVERRIDING SYSTEM VALUE
VALUES
('Ahmed Saad','Ahmed.Saad@tore.com',md5('SaadPassword'),'Male',DATE '1995-02-19','Padova', '1', 1),
('Bahrami Sepide','Bahrami.Sepide@tore.com',md5('SepidePassword'),'Female',DATE '1995-02-19','Padova','1', 1),	
('Hansen Marit Fredrikke','Hansen.MaritFredrikke@tore.com',md5('MaritPassword'),'Female',DATE '1995-02-19','Padova','1', 1),		
('Rao Abdul Moeed','Rao.AbdulMoeed@tore.com',md5('MoeedPassword'),'Male',DATE '1995-02-19','Padova','1', 1),			
('Rehman Abdul','Rehman.Abdul@tore.com',md5('AbdulPassword'),'Male',DATE '1995-02-19','Padova','1', 1),		
('Sohai Mohammad Muzammil','Sohai.MohammadMuzammil@tore.com',md5('MuzammilPassword'),'Male',DATE '1995-02-19','Padova','1', 1),		
('Soomro Dodo Khan','Soomro.DodoKhan@tore.com',md5('DKPassword'),'Male',DATE '1995-02-19','Padova','1', 1),
('Sultanova Aliia','Sultanova.Aliia@tore.com',md5('AliiaPassword'),'Female',DATE '1995-02-19','Padova','1', 1),
('Zabalawi  Iyad','Zabalawi.Iyad@tore.com',md5('IyadPassword'),'Male',DATE '1995-02-19','Padova','1', 1);

INSERT INTO lms_teacher (name, email, password, gender, address) VALUES 
('Nicola Ferro','Nicola.Ferro@tore.com',md5('SaadPassword'),'Male','Padova');

INSERT INTO lms_course(name, description, prerequistie) VALUES
('Web Applications', 'This course lays the foundations of Web design and development, practicing them through the implementation of an actual application.
We will learn both server-side and client-side Web technologies and how to build full-stack Web applications and Web services, by using Java servlets, REST Web services, Javascript, CSS3 and HTML5.','Java, Javascript, CSS3, HTML5'),
('Search Engines', 'This course teaches how to design and develop systems for searching, retrieving, and ranking unstructured information at Web scale.
We will learn the theoretical and technical foundations of information retrieval, focusing on reference applications like search engines, recommender systems, and social media.', 'Java, good and proactive programming skills and, in particular, the object-oriented paradigm and its design principles.'),
('Foundations of Databases', 'This course lays the foundations of data management and modelling, providing you with the indispensable knowledge needed for storing and searching structured data.
We will learn about conceptual database design, the relational model, and the Structured Query Language (SQL), as well as how to employ them to design and develop database applications in real-world scenarios.', 'Basic knowledge of the Java programming language.');

INSERT INTO lms_material(topic, text, img_name, img_file, course_id, teacher_id) VALUES
('topic1', 'learning this and that', null, null, 1, 1),
('topic1', 'learning this and that', null, null, 2, 1),
('topic1', 'learning this and that', null, null, 3, 1);

INSERT INTO lms_attend(student_id, course_id) 
OVERRIDING SYSTEM VALUE
VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

INSERT INTO lms_message(student_id, teacher_id, topic, text, timestamp) 
OVERRIDING SYSTEM VALUE
VALUES 
(1, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(2, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(3, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(4, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(5, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(6, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(7, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(8, 1, null, 'abc', TIMESTAMP '2022-05-20'),
(9, 1, null, 'abc', TIMESTAMP '2022-05-20');

INSERT INTO lms_register(admin_id, teacher_id, course_id)
OVERRIDING SYSTEM VALUE
VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3);