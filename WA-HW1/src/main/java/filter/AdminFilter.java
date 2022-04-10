package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import servlet.UserServlet;

import java.io.IOException;


public class AdminFilter extends AbstractFilter {

    final static Logger logger = LogManager.getLogger(AdminFilter.class);


    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

        HttpSession session = req.getSession(false);
        String loginURI = req.getContextPath() + "/jsp/login.jsp";
        String unauthorizedPage = req.getContextPath() + "/jsp/unauthorized.jsp";

        boolean loggedIn = session != null && session.getAttribute("email") != null;

        if (loggedIn) {
            if (session.getAttribute("role").equals("admin")) {
                res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                chain.doFilter(req, res); // User is logged in, just continue request.
            }
            else {
                logger.info("user "+session.getAttribute("email")+
                        " with role "+session.getAttribute("role")+
                        " tried to access the admin page");
                res.sendRedirect(unauthorizedPage); //Not authorized, show the proper page
            }
        } else {
            res.sendRedirect(loginURI); // Not logged in, show login page.
        }
    }


}
