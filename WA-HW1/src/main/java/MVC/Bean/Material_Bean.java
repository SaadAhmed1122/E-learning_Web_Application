package MVC.Bean;

public class Material_Bean {
    String topic,text,img_file;
    int course_id,teacher_id;

    public Material_Bean(String topic, String text, String img_file, int course_id, int teacher_id) {
        this.topic = topic;
        this.text = text;
        this.img_file = img_file;
        this.course_id = course_id;
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

    public String getImg_file() {
        return img_file;
    }

    public void setImg_file(String img_file) {
        this.img_file = img_file;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }
}
