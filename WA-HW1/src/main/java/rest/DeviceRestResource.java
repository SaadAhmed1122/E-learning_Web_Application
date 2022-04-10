package rest;

import dao.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.*;
import resource.*;
import utils.ErrorCode;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class DeviceRestResource extends RestResource {

    protected final String op;
    protected ErrorCode ec = null;
    protected String response = null;
    protected final String[] tokens;

    public DeviceRestResource(HttpServletRequest req, HttpServletResponse res, Connection con) {
        super(req, res, con);
        op = req.getRequestURI();
        tokens = op.split("/");

    }

    public void getRideDevices() throws IOException {
        try {
            List<Device> devices = new GetDevicesByRideDatabase(con,  new Ride(Integer.parseInt(tokens[5]))).getDevicesByRide();
            ec = ErrorCode.OK;
            response = new JSONObject().put("data", new JSONObject().put("devices-list", devices)).toString();

        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }

    public void insertRideDevices() throws IOException {
        try {
            if (new GetRideByIdDatabase(con, new Ride(Integer.parseInt(tokens[5]))).getRideById() == null) {
                initError(ErrorCode.RIDE_NOT_FOUND);
            } else {
                List<Device> devices = Device.fromJSONlist(req.getInputStream());
                List<JSONObject> errors = new ArrayList<>();
                for (Device device : devices) {
                    if (new InsertDeviceDatabase(con, device).insertDevice() != null) {
                        if (new GetRideByIdDatabase(con, new Ride(device.getRideid())).getRideById()==null) {
                            errors.add(new JSONObject().put("reason", "rideid not found").put("device", device));
                        } else  {
                            errors.add(new JSONObject().put("reason", "unknown").put("device", device));
                        }
                    }
                }
                if (errors.size() > 0) {
                    response = new JSONObject().put("total", devices.size()).put("failed", errors.size()).put("errors", errors).toString();
                } else {
                    ec = ErrorCode.OK;
                    response = new JSONObject().put("result", "successfull").toString();
                }
            }
        } catch (JSONException e) {
            initError(ErrorCode.BADLY_FORMATTED_JSON);
            logger.error("stacktrace:", e);
        } catch (SQLException  e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }

    }


    public void deleteRideDevices() throws IOException {
        try {
            Ride ride = new Ride(Integer.parseInt(tokens[5]));

            if (new GetRideByIdDatabase(con, ride).getRideById()  != null) {

                List<Device> devicesList = new GetDevicesByRideDatabase(con ,ride).getDevicesByRide();
                List<JSONObject> errors = new ArrayList<>();


                for (Device device : devicesList) {
                    if (new DeleteDeviceDatabase(con, device).deleteDevice() == null) {
                        if (new GetRideByIdDatabase(con, ride).getRideById() == null) {
                            errors.add(new JSONObject().put("deviceid", device).put("reason", "rideid not found"));
                        } else {
                            errors.add(new JSONObject().put("deviceid", device).put("reason", "unknown"));
                        }
                    }
                }

                if (errors.size()>0) {
                    response = new JSONObject().put("total", devicesList.size()).put("failed", errors.size()).put("errors", errors).toString();

                } else {
                    ec = ErrorCode.OK;
                    response = new JSONObject().put("result", "successfull").toString();
                }

            } else {
                initError(ErrorCode.RIDE_NOT_FOUND);
            }
        }  catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }

    }

    public void getDevice() throws IOException {
        try {
            Device device = new GetDeviceByIdDatabase(con, new Device(Integer.parseInt(tokens[4]))).getDeviceById();
            if (device!=null){
                res.setStatus(HttpServletResponse.SC_OK);
                response = new JSONObject().put("data", new JSONObject().put("device", device.toJSON())).toString();
            } else {
                initError(ErrorCode.DEVICE_NOT_FOUND);
            }

        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }

    public void updateDevice() throws IOException {
        try {
            int deviceid = Integer.parseInt(tokens[4]);
            Device device = Device.fromJSON(req.getInputStream());
            if (deviceid != device.getDeviceid()) {

            } else {
                if (new UpdateDeviceDatabase(con, device).updateDevice() != null) {
                    ec = ErrorCode.OK;
                    response = new JSONObject().put("result", "successfull").toString();
                } else {
                    if (new GetDeviceByIdDatabase(con, device).getDeviceById() == null) {
                        initError(ErrorCode.DEVICE_NOT_FOUND);
                    } else if (new GetRideByIdDatabase(con, new Ride(device.getRideid())).getRideById() == null) {
                        initError(ErrorCode.RIDE_NOT_FOUND);
                    } else {
                        initError(ErrorCode.INTERNAL_ERROR);
                    }
                }
            }
        } catch (JSONException e) {
            initError(ErrorCode.BADLY_FORMATTED_JSON);
            logger.error("stacktrace:", e);
        } catch (SQLException e) {
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }

    public void insertDevice() throws IOException {
        try {
            Device device = Device.fromJSON(req.getInputStream());
            if (new InsertDeviceDatabase(con, device).insertDevice()!= null) {
                ec = ErrorCode.OK;
                response = new JSONObject().put("result", "successfull").toString();
            } else if (new GetRideByIdDatabase(con, new Ride(device.getRideid())).getRideById()==null) {
                initError(ErrorCode.RIDE_NOT_FOUND);
            } else {
                initError(ErrorCode.INTERNAL_ERROR);
            }
        } catch (JSONException e) {
            initError(ErrorCode.BADLY_FORMATTED_JSON);
            logger.error("stacktrace:", e);
        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }

    public void deleteDevice() throws IOException {
        try {
            if (new DeleteDeviceDatabase(con, new Device(Integer.parseInt(tokens[4]))).deleteDevice()!=null){
                ec = ErrorCode.OK;
                response = new JSONObject().put("result", "successful").toString();
            } else {
                initError(ErrorCode.DEVICE_NOT_FOUND);
            }
        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }

    private void respond() throws IOException {
        res.setStatus(ec.getHTTPCode());
        res.getWriter().write(response);
    }

    private void initError(ErrorCode ec){
        this.ec = ec;
        response = ec.toJSON().toString();
    }
}
