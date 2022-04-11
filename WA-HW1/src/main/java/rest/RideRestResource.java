package rest;

import dao.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.*;
import resource.*;
import utils.ErrorCode;

import java.io.IOException;
import java.sql.*;

public class RideRestResource extends RestResource {

    protected final String op;
    protected ErrorCode ec = null;
    protected String response = null;
    protected final String[] tokens;

    public RideRestResource(HttpServletRequest req, HttpServletResponse res, Connection con) {
        super(req, res, con);
        op = req.getRequestURI();
        tokens = op.split("/");
    }

    public void getRideList() throws IOException {
        try {
            ec = ErrorCode.OK;
            res.setContentType("application/json");
            response = new JSONObject().put("data", new JSONObject().put("ride-ids-list", new ListRidesIdDatabase(con).listRidesIdByPark())).toString();
        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally {
            respond();
        }
    }

    public void getRide() throws IOException{
        try {
            Ride ride = new GetRideByIdDatabase(con, new Ride(Integer.parseInt(tokens[4]))).getRideById();
            if (ride!=null){
                ec = ErrorCode.OK;
                response = ride.toJSON().toString();
            } else {
                initError(ErrorCode.RIDE_NOT_FOUND);
            }
        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally {
            respond();
        }
    }


    public void insertRide() throws IOException{
        try {
            Ride ride = Ride.fromJSON(req.getInputStream());
            Ride newRide = new InsertRideDatabase(con, ride).insertRide();
            if (newRide!=null){
                ec = ErrorCode.OK;
                res.setContentType("application/json");
                response = new JSONObject().put("data", new JSONObject().put("rideid", newRide.getRideid())).toString();

            } else {
                if (new GetRideByIdDatabase(con, ride).getRideById()!=null) {
                    initError(ErrorCode.RIDE_ALREADY_PRESENT);
                } else if (new GetParkByNameDatabase(con, new Park(ride.getParkid())).getParkByName()==null) {
                    initError(ErrorCode.PARK_NOT_FOUND);
                } else if (new GetModelByNameDatabase(con, new Model(ride.getModelid())).getModelByName()==null) {
                    initError(ErrorCode.MODEL_NOT_FOUND);
                } else{
                    initError(ErrorCode.INTERNAL_ERROR);
                }
            }
        } catch (JSONException e){
            initError(ErrorCode.BADLY_FORMATTED_JSON);
            logger.error("stacktrace:", e);
        } catch (SQLException e) {
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } finally { respond(); }
    }


    public void updateRide() throws IOException {

        int rideid = Integer.parseInt(tokens[4]);

        try{
            Ride ride = Ride.fromJSON(req.getInputStream());

            if (rideid!=ride.getRideid()){
                initError(ErrorCode.RIDEID_MISMATCH);
            } else {
                if (new UpdateRideDatabase(con, ride).updateRide() != null) {
                    Message m = new Message(true, "Ride updated correctly");
                    ec = ErrorCode.OK;
                    response = m.toJSON().toString();
                } else {
                    if (new GetRideByIdDatabase(con, ride).getRideById()!=null) {
                        initError(ErrorCode.RIDE_ALREADY_PRESENT);
                    } else if (new GetParkByNameDatabase(con, new Park(ride.getParkid())).getParkByName()==null) {
                        initError(ErrorCode.PARK_NOT_FOUND);
                    } else if (new GetModelByNameDatabase(con, new Model(ride.getModelid())).getModelByName()==null) {
                        initError(ErrorCode.MODEL_NOT_FOUND);
                    } else{
                        initError(ErrorCode.INTERNAL_ERROR);
                    }
                }
            }
        } catch (JSONException e){
            initError(ErrorCode.BADLY_FORMATTED_JSON);
            logger.error("stacktrace:", e);
        } catch (SQLException e){
            initError(ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
        finally { respond(); }
    }


    public void deleteRide() throws IOException {
        try {

            if (new DeleteRideDatabase(con, new Ride(Integer.parseInt(tokens[4]))).deleteRide()==null){
                initError(ErrorCode.INTERNAL_ERROR);
            } else {
                ec = ErrorCode.OK;
                response = new Message(true, "Ride deleted correctly").toJSON().toString();
            }

        } catch (SQLException e) {
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
