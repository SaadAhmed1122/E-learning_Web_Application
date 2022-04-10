package servlet;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import resource.*;
import utils.ErrorCode;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class ParkServlet extends AbstractServlet{

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("park") + 5);

        switch (op){
            case "editable/":
                String parkName = req.getParameter("park");
                if (parkName==null || parkName.equals("")){
                    req.getRequestDispatcher("/jsp/builder-area/edit-park.jsp").forward(req, res);
                }
                try {
                    Park park = new Park(parkName);

                    park = new GetParkByNameDatabase(getDataSource().getConnection(), park).getParkByName();
                    if (park == null) {
                        Message m = new Message(true, "park not found");
                        res.setStatus(200);
                        req.getRequestDispatcher("/jsp/builder-area/edit-park.jsp").forward(req, res);
                    } else {
                        req.setAttribute("park", park);
                        res.setStatus(200);
                        req.getRequestDispatcher("/jsp/builder-area/edit-park.jsp").forward(req, res);
                    }
                } catch(NamingException | SQLException e){
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                }
                break;
            case "list/":
                try{
                    List<String> parkNames = new ListParksNamesDatabase(getDataSource().getConnection()).listParksNames();
                    JSONObject resJSON = new JSONObject();
                    resJSON.put("park-names-list", parkNames);
                    res.setStatus(HttpServletResponse.SC_OK);
                    res.setContentType("application/json");
                    res.getWriter().write((new JSONObject()).put("data", resJSON).toString());
                } catch (NamingException | SQLException e){
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                }
                break;
            case "overview/":
                overviewDataOperations(req, res);
                break;
            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op "+op);
        }

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("edit")+5);

        switch (op){
            case "update/":
                updateOperations(req, res);
                break;
            case "insert/":
                insertionOperations(req, res);
                break;
            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op "+op);
        }

    }

    @Override
    public void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        deleteOperations(req, res);
    }



    private void overviewDataOperations(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            logger.debug("overview page shown");
            List <JSONObject> result = new ArrayList<>();
            List<Park> parks = new ListParksDatabase(getDataSource().getConnection()).listParks();
            List<Ride> rides;
            JSONObject parkJSON;
            JSONObject rideJSON;
            List<JSONObject> ridesJSON;

            Model model = null;

            for(int i=0; i<parks.size(); i++){
                parkJSON = new JSONObject();
                parkJSON.put("name", parks.get(i).getName());
                parkJSON.put("address", parks.get(i).getAddress());
                parkJSON.put("email", parks.get(i).getEmail());

                rides = new ListRidesByParkDatabase(getDataSource().getConnection(), parks.get(i)).getRidesByPark();
                ridesJSON = new ArrayList<>();
                for(int j=0; j<rides.size(); j++){
                    rideJSON = new JSONObject();
                    rideJSON.put("description", rides.get(j).getDescription());
                    model = new Model(rides.get(j).getModelid());
                    model = new GetModelByNameDatabase(getDataSource().getConnection(), model).getModelByName();
                    rideJSON.put("model_desc", model.getDescription());
                    ridesJSON.add(rideJSON);
                }
                parkJSON.put("rides", ridesJSON);

                result.add(parkJSON);
            }

            JSONObject resultJSON = new JSONObject();
            resultJSON.put("data", result);

            res.setStatus(HttpServletResponse.SC_OK);
            res.setContentType("application/json");
            res.getWriter().write(resultJSON.toString());

        } catch (NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    private void insertionOperations(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

        try {
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String email = req.getParameter("email");

            Park park;
            ErrorCode ec = null;
            Message m = null;
            String dispatchPage = null;
            boolean insertable = true;
            if (name == null || name.equals("") || address == null || address.equals("") || email == null || email.equals("")) {
                ec = ErrorCode.EMPTY_INPUT_FIELDS;
                m = new Message(true, ec.getErrorMessage());
                dispatchPage = "/jsp/builder-area/edit-park.jsp";
            } else {
                park = new Park(name, email, address);
                if (new GetParkByNameDatabase(getDataSource().getConnection(), park).getParkByName() != null) {
                    insertable = false;
                    ec = ErrorCode.PARK_ALREADY_PRESENT;
                    m = new Message(true, ec.getErrorMessage());
                    dispatchPage = "/jsp/builder-area/edit-park.jsp";
                }

                if (insertable) {
                    park = new InsertParkDatabase(getDataSource().getConnection(), park).insertPark();
                    if (park != null) {
                        m = new Message(true, "Park inserted correctly");
                        ec = ErrorCode.OK;
                        dispatchPage = "/jsp/message-page.jsp";
                    } else {
                        writeError(res, ErrorCode.INTERNAL_ERROR);
                        logger.error("unknown error: " + req.getRequestURL());
                    }
                }
            }

            res.setStatus(ec.getHTTPCode());
            req.setAttribute("message", m);
            req.getRequestDispatcher(dispatchPage).forward(req, res);

        } catch (NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    private void updateOperations(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        try {
            String name = req.getParameter("original_name");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            Park park = null;
            boolean updatable=true;
            ErrorCode ec = null;
            Message m = null;
            String dispatchPage = null;

            if (name == null || name.equals("") || address == null || address.equals("") || email == null || email.equals("")) {
                updatable=false;
                ec = ErrorCode.EMPTY_INPUT_FIELDS;
                m = new Message(true, ec.getErrorMessage());
                dispatchPage = "/jsp/builder-area/edit-park.jsp";
            } else {
                park = new Park(name, email, address);
                if (new GetParkByNameDatabase(getDataSource().getConnection(), park).getParkByName()==null){
                    updatable = false;
                    ec = ErrorCode.PARK_NOT_FOUND;
                    m = new Message(true, ec.getErrorMessage());
                    dispatchPage = "/jsp/builder-area/edit-park.jsp";
                }

                if (updatable){
                    park = new UpdateParkDatabase(getDataSource().getConnection(), park).updatePark();
                    if (park!=null) {
                        ec = ErrorCode.OK;
                        m = new Message(true, "Park updated correctly");
                        dispatchPage= "/jsp/message-page.jsp";
                    } else {
                        writeError(res, ErrorCode.INTERNAL_ERROR);
                        logger.error("problem when updating park: " + req.getRequestURL());
                    }
                }
            }

            req.setAttribute("message", m);
            res.setStatus(ec.getHTTPCode());
            req.getRequestDispatcher(dispatchPage).forward(req, res);

        } catch (NamingException | SQLException e) {
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    private void deleteOperations(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String parkname = req.getParameter("original_name");
        Park park;
        try {
            if (parkname == null || parkname.equals("")) {
                Message m = new Message(true, "Park not found");
                ErrorCode ec = ErrorCode.PARK_NOT_FOUND;
                res.setStatus(ec.getHTTPCode());
                req.setAttribute("message", m);
                req.getRequestDispatcher("/jsp/builder-area/edit-park.jsp").forward(req, res);
            } else {
                park = new Park(parkname);
                park = new DeleteParkDatabase(getDataSource().getConnection(), park).deletePark();
                if (park != null) {
                    logger.error("park deleted correctly");
                    Message m = new Message(true, "Park deleted correctly");
                    res.setStatus(HttpServletResponse.SC_OK);

                    res.getWriter().write(m.toJSON().toString());
                } else {
                    ErrorCode ec = ErrorCode.INTERNAL_ERROR;
                    writeError(res, ec);
                    logger.error("problem when deleting park: " + req.getRequestURL());
                }
            }
        } catch (SQLException | NamingException e) {
            ErrorCode ec = ErrorCode.INTERNAL_ERROR;
            writeError(res, ec);
            logger.error("stacktrace:", e);
        }
    }
}
