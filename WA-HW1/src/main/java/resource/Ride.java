package resource;

import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

public class Ride {

    private final int rideid;
    private String description;
    private String parkid;
    private String modelid;


    public Ride(int rideid){
        this.rideid = rideid;
    }

    public Ride(int rideid, String description, String parkid, String modelid) {
        this.rideid = rideid;
        this.description = description;
        this.parkid = parkid;
        this.modelid = modelid;
    }

    public String toString(){
        return "RIDE - rideid: %d model: %s park: %s description: %s".formatted(rideid, modelid, parkid, description);
    }

    public String getDescription() {
        return description;
    }

    public String getModelid() {
        return modelid;
    }

    public String getParkid() {
        return parkid;
    }

    public int getRideid() {
        return rideid;
    }


    public JSONObject toJSON(){
        JSONObject jobj  = new JSONObject();
        jobj.put("rideid", this.rideid);
        jobj.put("description", this.description);
        jobj.put("parkid", this.parkid);
        jobj.put("modelid", this.modelid);
        return jobj;
    }

    public static Ride fromJSON(InputStream inputStream) throws IOException, JSONException {
        String dataString = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
        JSONObject jobj = new JSONObject(dataString);
        String description = jobj.getString("description");
        String parkid = jobj.getString("parkid");
        String modelid = jobj.getString("modelid");
        int rideid=0;
        if (jobj.has("rideid")){
            rideid = jobj.getInt("rideid");
        }
        return new Ride(rideid, description, parkid, modelid);
    }
}
