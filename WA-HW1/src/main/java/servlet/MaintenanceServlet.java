package servlet;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import resource.*;
import utils.ErrorCode;

import javax.naming.NamingException;
import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

public class MaintenanceServlet extends AbstractServlet{


    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("maintenance")+12);

        switch (op){
            case "search/":
                try {
                    String rideidString = req.getParameter("rideid");
                    boolean planned = Boolean.parseBoolean(req.getParameter("planned"));
                    boolean notPlanned = Boolean.parseBoolean(req.getParameter("notPlanned"));
                    String start_date = req.getParameter("start_date");
                    String end_date = req.getParameter("end_date");

                    if (rideidString==null||rideidString.equals("")){
                        writeError(res, ErrorCode.RIDEID_NOT_PROVIDED);
                    } else {
                        int rideid = Integer.parseInt(rideidString);
                        List<Event> events = new ListEventsDatabase(getDataSource().getConnection(),
                                rideid, planned, notPlanned, start_date, end_date).listEvents();
                        res.setContentType("application/json");
                        res.setStatus(HttpServletResponse.SC_OK);
                        res.getWriter().write(new JSONObject().put("data", new JSONObject().put("events-list", events)).toString());

                    }
                } catch (NumberFormatException e){
                    writeError(res, ErrorCode.WRONG_FORMAT);
                } catch (SQLException | NamingException e) {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                    logger.error("stacktrace", e);
                }
                break;

            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested GET operation:" + op);
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("maintenance")+12);

        switch (op){
            case "insert/":
                insertOperations(req, res);
                break;

            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op "+op);
        }

    }


    private void insertOperations(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        try {
            String type = req.getParameter("type");
            String description = req.getParameter("description");
            String rideidstring = req.getParameter("rideid");
            String userid = req.getSession(false).getAttribute("email").toString();
            String date_perfromed = req.getParameter("date_performed");
            boolean planned = Boolean.parseBoolean(req.getParameter("planned"));

            if (type == null || rideidstring == null || userid == null || date_perfromed == null) {
                writeError(res, ErrorCode.EMPTY_INPUT_FIELDS);
            } else {
                int rideid = Integer.parseInt(rideidstring);
                Event event = new Event(type, description, rideid, userid, date_perfromed, planned);
                if (new InsertEventDatabase(getDataSource().getConnection(), event).insertEvent()!=null) {
                    Message m = new Message(true, "Maintenance event inserted correctly");
                    res.setStatus(HttpServletResponse.SC_OK);
                    res.setContentType("jsp/html");
                    req.setAttribute("message", m);
                    req.getRequestDispatcher("/jsp/message-page.jsp").forward(req, res);
                } else if (new GetRideByIdDatabase(getDataSource().getConnection(), new Ride(rideid)).getRideById()==null) {
                    writeError(res, ErrorCode.RIDE_NOT_FOUND);
                } else if (new GetUserByMailDatabase(getDataSource().getConnection(), new User(userid)).getUserByMail()==null){
                    writeError(res, ErrorCode.USER_NOT_FOUND);
                } else {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                }
            }
        } catch (SQLException | NamingException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }


}
