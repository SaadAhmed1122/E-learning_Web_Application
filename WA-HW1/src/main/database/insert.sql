INSERT INTO lms_admin(email, password)
VALUES('tore@admin.com', 'Root@12345');

INSERT INTO lms_student(name, email, password, gender, birthdate, address, approved) 
VALUES
('Ahmed Saad','Saad@tore.com','SaadPassword1','Male','02/19/1995','Padova', '1'),
('Bahrami Sepide','Sepide@tore.com','SepidePassword1','Female','02/19/1995','Padova','1'),
('Hansen Marit Fredrikke','Hansen.MaritFredrikke@tore.com','MaritPassword1','Female','02/19/1995','Padova','1'),		
('Rao Abdul Moeed','Rao.AbdulMoeed@tore.com','MoeedPassword1','Male','02/19/1995','Padova','1'),			
('Rehman Abdul','Rehman.Abdul@tore.com','AbdulPassword1','Male','02/19/1995','Padova','1'),		
('Sohai Mohammad Muzammil','Sohai.MohammadMuzammil@tore.com','MuzammilPassword1','Male','02/19/1995','Padova','1'),		
('Soomro Dodo Khan','Soomro.DodoKhan@tore.com','DKPassword1','Male','02/19/1995','Padova','1'),
('Sultanova Aliia','Sultanova.Aliia@tore.com','AliiaPassword1','Female','02/19/1995','Padova','1'),
('Zabalawi  Iyad','Zabalawi.Iyad@tore.com','IyadPassword1','Male','02/19/1995','Padova','1');

INSERT INTO lms_teacher (name, email, password, gender, address) VALUES 
('Nicola Ferro','Nicola.Ferro@tore.com','NicolaPassword1','Male','Padova');

INSERT INTO lms_course(name, description, prerequistie) VALUES
('Web Applications', 'This course lays the foundations of Web design and development, practicing them through the implementation of an actual application.
We will learn both server-side and client-side Web technologies and how to build full-stack Web applications and Web services, by using Java servlets, REST Web services, Javascript, CSS3 and HTML5.','Java, Javascript, CSS3, HTML5'),
('Search Engines', 'This course teaches how to design and develop systems for searching, retrieving, and ranking unstructured information at Web scale.
We will learn the theoretical and technical foundations of information retrieval, focusing on reference applications like search engines, recommender systems, and social media.', 'Java, good and proactive programming skills and, in particular, the object-oriented paradigm and its design principles.'),
('Foundations of Databases', 'This course lays the foundations of data management and modelling, providing you with the indispensable knowledge needed for storing and searching structured data.
We will learn about conceptual database design, the relational model, and the Structured Query Language (SQL), as well as how to employ them to design and develop database applications in real-world scenarios.', 'Basic knowledge of the Java programming language.');

INSERT INTO lms_material(topic, text, img_file, course_id, teacher_id) VALUES
('topic1', 'learning Web Applications', 'https://sc04.alicdn.com/kf/U18a4a096b0564d01b2caef2f382f36ad1.jpg', 1, 1),
('topic2', 'learning Search Engines', 'https://seodesignchicago.com/wp-content/uploads/2019/10/search-engines.png', 2, 1);

INSERT INTO lms_attend(student_id, course_id, approved) 
VALUES 
(1, 1, '1'),
(2, 1, '1');

INSERT INTO lms_message(student_id, teacher_id, topic, text) 
VALUES 
(1, 1, 'exams', 'when is exams?'),
(2, 1, 'lectures', 'where is the lecture?');


INSERT INTO lms_assign_courses(teacher_id, course_id)
VALUES 
(1, 1),
(1, 2),
(1, 3);