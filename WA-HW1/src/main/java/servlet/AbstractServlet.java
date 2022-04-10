package servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import utils.ErrorCode;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;

public class AbstractServlet extends HttpServlet {

    Logger logger;
    private static DataSource ds = null;


    //override the init method: here you should put the initialization of your servlet
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        logger = LogManager.getLogger(this.getClass());
    }


    //override destroy method: here you should put the behaviour of your servlet when destroyed
    @Override
    public void destroy(){
        super.destroy();
    }

    public void writeError(HttpServletResponse res, ErrorCode ec) throws IOException {
        res.setStatus(ec.getHTTPCode());
        res.getWriter().write(ec.toJSON().toString());
    }

    public DataSource getDataSource() throws NamingException {

        // we don't want to initialize a new datasoruce everytime, so, we check first that ds is null
        if (ds == null) {

            //we get the context
            InitialContext ctx = new InitialContext();

            //and use the proper resource to initialize the datasource
            ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/amusement-park");
        }
        return ds;
    }
}
