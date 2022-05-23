package MVC.Bean;

public class MessagingBean {
    int student_id;
    int teacher_id;
    String topic;
    String text;

    public MessagingBean(int std_id, int tch_id, String tpc, String txt) {
        this.student_id = std_id;
        this.teacher_id = tch_id;
        this.topic = tpc;
        this.text =  txt;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
