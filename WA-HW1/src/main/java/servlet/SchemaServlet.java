package servlet;

import dao.ListRolesDatabase;
import dao.ListEventCategoriesDatabase;
import dao.ListSessionTypesDatabase;
import dao.ListDeviceTypesDatabase;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import utils.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class SchemaServlet extends AbstractServlet {


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        try {
            String op = req.getRequestURI();
            op = op.substring(op.lastIndexOf("schema") + 7);
            boolean error = false;
            List<String> resource = null;

            switch(op){
                case "roles/":
                    resource = new ListRolesDatabase(getDataSource().getConnection()).listRoles();
                    break;
                case "sessiontypes/":
                    resource = new ListSessionTypesDatabase(getDataSource().getConnection()).listSessionTypes();
                    break;
                case "eventcategories/":
                    resource = new ListEventCategoriesDatabase(getDataSource().getConnection()).listEventCategories();
                    break;
                case "devicetypes/":
                    resource = new ListDeviceTypesDatabase(getDataSource().getConnection()).listDeviceTypes();
                    break;
                default:
                    error = true;
                    ErrorCode ec = ErrorCode.OPERATION_UNKNOWN;
                    writeError(res, ec);
                    break;
            }
            if (!error){
                res.setContentType("application/json");
                JSONObject resJSON = new JSONObject();
                resJSON.put("data", resource);
                res.getWriter().write(resJSON.toString());
            }
        } catch (SQLException | NamingException e){
            ErrorCode ec = ErrorCode.INTERNAL_ERROR;
            writeError(res, ec);
            logger.error("stacktrace:", e);
        }
    }
}
