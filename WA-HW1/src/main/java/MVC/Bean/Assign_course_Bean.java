package com.example.elearning_project.MVC.Bean;

public class Assign_course_Bean {
    int teacher_id;
    int course_id;

    public Assign_course_Bean(int teacher_id, int course_id) {
        this.teacher_id = teacher_id;
        this.course_id = course_id;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
