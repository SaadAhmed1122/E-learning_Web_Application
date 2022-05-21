package MVC.Bean;

public class Attend_Bean {
    int student_id;
    int course_id;
    boolean approval;

    public Attend_Bean(int std_id, int crs_id, boolean appr) {
        this.student_id = std_id;
        this.course_id = crs_id;
        this.approval = appr;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public boolean isApproval() {
        return approval;
    }

    public void setApproval(boolean approval) {
        this.approval = approval;
    }
}
