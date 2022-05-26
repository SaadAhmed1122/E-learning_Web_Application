package MVC.Controller;

import MVC.Bean.Assign_course_Bean;
import MVC.Bean.CourseBean;
import MVC.Bean.TeacherBean;
import MVC.dao.Assign_course_dao;
import MVC.dao.CourseDao;
import MVC.dao.TeacherManagmentDao;
import MVC.dao.TeacherRegistrationDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if(req.getParameter("btn_register")!= null){
            String coursename=req.getParameter("coursename");
            String desc= req.getParameter("desc");
            String prereq = req.getParameter("prereq");

            CourseBean courseBean = new CourseBean(coursename,desc,prereq);
            courseBean.setName(coursename);
            courseBean.setDescription(desc);
            courseBean.setPrerequistie(prereq);


            CourseDao courseDao= new CourseDao();
            String registercourse= courseDao.insertCourse(courseBean);

            if(registercourse.equals("SUCCESS REGISTER")){

                RequestDispatcher requestDispatcher = req
                        .getRequestDispatcher("./addcoursesandteacher.jsp");
                requestDispatcher.forward(req, resp);

            }
            else {
                req.setAttribute("RegisterSuccessMsg",registercourse);
                RequestDispatcher re= req.getRequestDispatcher("./addcoursesandteacher.jsp");
                re.include(req,resp);
            }
        }

        if(req.getParameter("assign_course")!=null){
            String teacher_name=req.getParameter("genderdropdown_teacher");
            String course_name=req.getParameter("genderdropdown_course");

            if (teacher_name !=null && course_name!=null)
            {
                System.out.println("Teacher_name : "+teacher_name);
                System.out.println("Selected Value : "+course_name);
                TeacherManagmentDao teacherDao= new TeacherManagmentDao();
                TeacherBean teacher_data= teacherDao.getteacherByname(teacher_name);

                int teacher_id = teacher_data.getTeacher_id();

                CourseDao courseDao= new CourseDao();
                CourseBean courseBean= courseDao.getcourseByname(course_name);
                System.out.println("Course Id  is "+courseBean.getCourse_id());
                int course_id = courseBean.getCourse_id();

//                Assign Course
                Assign_course_Bean assignbeancourse = new Assign_course_Bean(teacher_id,course_id);
               assignbeancourse.setCourse_id(course_id);
               assignbeancourse.setTeacher_id(teacher_id);


                Assign_course_dao assign_cource_dao= new Assign_course_dao();
                String assigncoursedao= assign_cource_dao.assigncoursefun(assignbeancourse);

                if(assigncoursedao.equals("SUCCESS REGISTER")){

                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("./addcoursesandteacher.jsp");
                    requestDispatcher.forward(req, resp);

                }
                else {
                    req.setAttribute("RegisterSuccessError",assigncoursedao);
                    RequestDispatcher re= req.getRequestDispatcher("./addcoursesandteacher.jsp");
                    re.include(req,resp);
                }

            }
        }

    }
}
