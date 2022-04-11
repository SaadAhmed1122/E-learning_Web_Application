package rest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;

public class RestResource {

    protected final HttpServletRequest req;
    protected final HttpServletResponse res;
    protected final Logger logger;
    protected final Connection con;
    public RestResource(HttpServletRequest req, HttpServletResponse res, Connection con){
        this.req = req;
        this.res = res;
        this.con = con;
        this.logger = LogManager.getLogger(this.getClass());
    }

}
