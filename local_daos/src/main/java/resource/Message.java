package resource;

import org.json.JSONObject;

public class Message {
    final boolean error;
    final String message;


    public Message(boolean error, String message) {
        this.error = error;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public boolean isError() {
        return error;
    }

    public JSONObject toJSON(){
        JSONObject result = new JSONObject();
        result.put("error", this.error);
        result.put("message", this.message);
        return result;
    }
}
