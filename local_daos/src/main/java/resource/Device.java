package resource;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class Device {

    private int deviceid;
    private String name;
    private String description;
    private String type;
    private int rideid;

    public Device(int deviceid){
        this.deviceid = deviceid;
    };

    public Device(int deviceid, String name, String description, String type, int rideid){
        this.name = name;
        this.description = description;
        this.type = type;
        this.rideid = rideid;
        this.deviceid = deviceid;
    }

    public Device(String name, String description, String type, int rideid){
        this.name = name;
        this.description = description;
        this.type = type;
        this.rideid = rideid;
    }

    public String toString(){
       return "device: %d name: %s type: %s description:%s mounted on ride: %d".formatted(deviceid, name, type, description, rideid);
    }

    public int getDeviceid() {
        return deviceid;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    public int getRideid() {
        return rideid;
    }


    public static List<Device> fromJSONlist(InputStream inputStream) throws IOException, JSONException {
        String dataString = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
        JSONObject jobj = new JSONObject(dataString);
        List<Device> devices = new ArrayList<>();
        JSONArray devicesJSONList = jobj.getJSONArray("devices-list");

        for(int i=0; i<devicesJSONList.length(); i++){
            devices.add(fromJSON(devicesJSONList.getJSONObject(i)));
        }

        return devices;
    }

    public static Device fromJSON(InputStream inputStream) throws IOException, JSONException {
        String dataString = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
        JSONObject jobj = new JSONObject(dataString);

        String description = jobj.getString("description");
        String name = jobj.getString("name");
        String type = jobj.getString("type");
        int rideid = jobj.getInt("rideid");
        int deviceid=0;
        if (jobj.has("deviceid")){
            deviceid =  jobj.getInt("deviceid");
        }
        return new Device(deviceid, name, description, type, rideid);
    }

    public static Device fromJSON(JSONObject jobj) throws JSONException {
        String description = jobj.getString("description");
        String name = jobj.getString("name");
        String type = jobj.getString("type");
        int rideid = jobj.getInt("rideid");
        int deviceid=0;
        if (jobj.has("deviceid")){
            deviceid =  jobj.getInt("deviceid");
        }
        return new Device(deviceid, name, description, type, rideid);
    }

    public JSONObject toJSON(){
        JSONObject deviceJSON = new JSONObject();
        deviceJSON.put("deviceid", deviceid);
        deviceJSON.put("name", name);
        deviceJSON.put("description", description);
        deviceJSON.put("type", type);
        deviceJSON.put("rideid", rideid);

        return deviceJSON;
    }
}
