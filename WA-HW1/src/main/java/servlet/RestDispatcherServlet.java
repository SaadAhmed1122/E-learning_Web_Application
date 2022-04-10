package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rest.DeviceRestResource;
import rest.RideRestResource;
import utils.ErrorCode;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

public class RestDispatcherServlet extends AbstractServlet{



    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        if(processRide(req, res)){
            return;
        }
        if(processDevice(req, res)){
            return;
        }
        writeError(res, ErrorCode.OPERATION_UNKNOWN);
        logger.warn("requested op " + op);

    }

    private boolean processRide(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String op = req.getRequestURI();
        String[] tokens = op.split("/");
        //the first token will always be the empty;
        //the second will be the context;
        //the third should be "ride";
        if (tokens.length<4 || !(tokens[3].equals("ride") || tokens[3].equals("list"))){
            return false;
        }

        try{
            if (tokens.length==4 && tokens[3].equals("ride")){
                RideRestResource rrr = new RideRestResource(req, res, getDataSource().getConnection());
                switch (req.getMethod()) {
                    case "POST" -> rrr.insertRide();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }
            }
            else if (tokens.length==5 && tokens[3].equals("list") && tokens[4].equals("ride")){
                RideRestResource rrr = new RideRestResource(req, res, getDataSource().getConnection());
                switch (req.getMethod()) {
                    case "GET" -> rrr.getRideList();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }
            } else if(tokens[3].equals("ride")){
                Integer.parseInt(tokens[4]);
                RideRestResource rrr = new RideRestResource(req, res, getDataSource().getConnection());
                switch (req.getMethod()) {
                    case "GET" -> rrr.getRide();
                    case "PUT" -> rrr.updateRide();
                    case "DELETE" -> rrr.deleteRide();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }

            } else {
                return  false;
            }

        } catch (NumberFormatException e){
            writeError(res, ErrorCode.WRONG_REST_FORMAT);
        } catch (NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }

        return true;

    }


    private boolean processDevice(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String op = req.getRequestURI();
        String[] tokens = op.split("/");

        //the user is not interested in devices
        if (tokens.length<4 || !tokens[3].equals("device")){
            return false;
        }

        //the user wants to deal with all the devices associated to a specific ride
        try {
            if(tokens.length==6 && tokens[4].equals("ride")) {
                Integer.parseInt(tokens[5]);
                //the user wants all the devices for a ride
                //the user wants to put all in the DB all the devices associated to a specific ride
                //the user wants to delete all devices associated to a ride
                DeviceRestResource drr = new DeviceRestResource(req, res, getDataSource().getConnection());
                switch (req.getMethod()) {
                    case "GET" -> drr.getRideDevices();
                    case "POST" -> drr.insertRideDevices();
                    case "DELETE" -> drr.deleteRideDevices();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }

            } else if (tokens.length==5) {
                Integer.parseInt(tokens[4]);
                DeviceRestResource drr = new DeviceRestResource(req, res, getDataSource().getConnection());
                switch (req.getMethod()) {
                    case "GET" -> drr.getDevice();
                    case "PUT" -> drr.updateDevice();
                    case "DELETE" -> drr.deleteDevice();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }

            } else if(tokens.length==4){
                switch (req.getMethod()) {
                    case "POST"-> new DeviceRestResource(req, res, getDataSource().getConnection()).insertDevice();
                    default -> writeError(res, ErrorCode.METHOD_NOT_ALLOWED);
                }
            } else {
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op " + op);
            }
        } catch (NumberFormatException e){
            writeError(res, ErrorCode.WRONG_REST_FORMAT);
        } catch (NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }



        return true;
    }
}
