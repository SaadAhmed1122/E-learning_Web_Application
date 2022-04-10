package servlet;

import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
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

public class ModelServlet extends AbstractServlet{

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("model") + 6);

        switch (op) {
            case "editable/":
                String modelName = req.getParameter("model");
                if (modelName==null || modelName.equals("")){
                    req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
                }
                try {
                    Model model = new Model(modelName);
                    model = new GetModelByNameDatabase(getDataSource().getConnection(), model).getModelByName();
                    if (model == null) {
                        ErrorCode ec = ErrorCode.MODEL_NOT_FOUND;
                        Message m = new Message(true, "model not found");
                        res.setStatus(ec.getHTTPCode());
                        req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
                    } else {
                        req.setAttribute("model", model);
                        res.setStatus(200);
                        req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
                    }
                } catch(NamingException | SQLException e){
                    ErrorCode ec = ErrorCode.INTERNAL_ERROR;
                    writeError(res, ec);
                }
                break;
            case "list/":
                try {
                    List<String> modelNames = new ListModelsNamesDatabase(getDataSource().getConnection()).listModelsNames();
                    JSONObject resJSON = new JSONObject();
                    resJSON.put("model-names-list", modelNames);
                    res.setStatus(HttpServletResponse.SC_OK);
                    res.setContentType("application/json");
                    res.getWriter().write((new JSONObject()).put("data", resJSON).toString());
                } catch (NamingException | SQLException e) {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                }
                break;
            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op "+op);

        }
    }


    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("model") + 6);

        switch (op) {
            case "insert/":
                insertOperations(req, res);
                break;
            case "update/":
                updateOperations(req, res);
                break;
            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
                logger.warn("requested op " + op);
        }
    }

    public void doDelete(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String modelName = req.getParameter("original_name");
        try {
            if (modelName == null || modelName.equals("")) {
                Message m = new Message(true, "Model not found");
                ErrorCode ec = ErrorCode.MODEL_NOT_FOUND;
                res.setStatus(ec.getHTTPCode());
                req.setAttribute("message", m);
                req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
            } else {
                Model model = new Model(modelName);
                model = new DeleteModelDatabase(getDataSource().getConnection(), model).deleteModel();
                if (model!=null){
                    logger.error("model deleted correctly");
                    Message m = new Message(true, "Model deleted correctly");
                    res.setStatus(HttpServletResponse.SC_OK);
                    res.getWriter().write(m.toJSON().toString());
                }
                else{
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                    logger.error("problem when deleting model: "+req.getRequestURL());
                }
            }
        } catch (SQLException | NamingException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    private void insertOperations(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        try {
            if (name == null || name.equals("")) {
                ErrorCode ec = ErrorCode.EMPTY_INPUT_FIELDS;
                req.setAttribute("message", new Message(true, ec.getErrorMessage()));
                res.setStatus(ec.getHTTPCode());
                req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
            } else {
                Model model = new Model(name, description);
                Model insertedModel = new InsertModelDatabase(getDataSource().getConnection(), model).insertModel();
                if (insertedModel!=null){
                    Message m = new Message(true, "Model inserted correctly");
                    res.setStatus(HttpServletResponse.SC_OK);
                    req.setAttribute("message", m);
                    req.getRequestDispatcher("/jsp/message-page.jsp").forward(req, res);
                } else if (new GetModelByNameDatabase(getDataSource().getConnection(), model).getModelByName()==null) {
                    ErrorCode ec = ErrorCode.MODEL_ALREADY_PRESENT;
                    req.setAttribute("message", new Message(true, ec.getErrorMessage()));
                    res.setStatus(ec.getHTTPCode());
                    req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
                } else {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                    logger.error("unknown error: "+req.getRequestURL());
                }
            }
        } catch (SQLException | NamingException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    private void updateOperations(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        try {
            String name = req.getParameter("original_name");
            String description = req.getParameter("description");

            Model model = new Model(name, description);
            if (name == null || name.equals("")) {
                ErrorCode ec = ErrorCode.EMPTY_INPUT_FIELDS;
                req.setAttribute("message", new Message(true, ec.getErrorMessage()));
                res.setStatus(ec.getHTTPCode());
                req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
            } else {

                Model updatedModel = new UpdateModelDatabase(getDataSource().getConnection(), model).updateModel();
                if (updatedModel!=null) {
                    Message m = new Message(true, "Model updated correctly");
                    res.setStatus(HttpServletResponse.SC_OK);
                    req.setAttribute("message", m);
                    req.getRequestDispatcher("/jsp/message-page.jsp").forward(req, res);
                }
                else if (new GetModelByNameDatabase(getDataSource().getConnection(), model).getModelByName()==null) {
                    ErrorCode ec = ErrorCode.MODEL_NOT_FOUND;
                    req.setAttribute("message", new Message(true, ec.getErrorMessage()));
                    req.setAttribute("model", model);
                    res.setStatus(ec.getHTTPCode());
                    req.getRequestDispatcher("/jsp/builder-area/edit-model.jsp").forward(req, res);
                } else {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                    logger.error("problem when updating model: " + req.getRequestURL());
                }
            }
        } catch (NamingException | SQLException e) {
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }

    }
}
