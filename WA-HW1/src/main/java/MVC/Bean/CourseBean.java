package com.example.elearning_project.MVC.Bean;

public class CourseBean {
    int course_id;
    String name,description,prerequistie;

    public CourseBean(String name, String description, String prerequistie) {
        this.name = name;
        this.description = description;
        this.prerequistie = prerequistie;
    }

    public CourseBean() {
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrerequistie() {
        return prerequistie;
    }

    public void setPrerequistie(String prerequistie) {
        this.prerequistie = prerequistie;
    }
}
