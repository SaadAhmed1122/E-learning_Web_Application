package resource;

import java.sql.Date;

public class Event {
    private int eventid;
    private final String type;
    private String description;
    private final int rideid;
    private final String userid;
    private final String date_performed;
    private boolean planned;



    public Event(int eventid, String type, String description, int rideid, String userid, String date_performed, boolean planned){

        this.eventid = eventid;
        this.type = type;
        this.description = description;
        this.rideid = rideid;
        this.userid = userid;
        this.date_performed = date_performed;
        this.planned = planned;
    }

    public Event(String type, String description, int rideid, String userid, String date_performed, boolean planned){
        this.type = type;
        this.description = description;
        this.rideid = rideid;
        this.userid = userid;
        this.date_performed = date_performed;
        this.planned = planned;
    }

    public String toString(){
        return "EVENT - type: %s rideid: %d user: %s date: %s planned: %s description: %s".formatted(type, rideid, userid, date_performed, planned, description);
    }


    public int getRideid() {
        return rideid;
    }

    public String getDescription() {
        return description;
    }

    public boolean isPlanned() {
        return planned;
    }

    public int getEventid() {
        return eventid;
    }

    public String getDate_performed() {
        return date_performed;
    }

    public String getType() {
        return type;
    }

    public String getUserid() {
        return userid;
    }
}
