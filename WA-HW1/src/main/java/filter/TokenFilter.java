package filter;


import dao.GetUserByMailAndPasswordDatabase;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.xml.bind.DatatypeConverter;
import resource.Message;
import resource.User;
import utils.ErrorCode;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

public class TokenFilter extends AbstractFilter {

    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {


        try {
            String authTokenHeader = req.getHeader("Authorization");
            logger.info(authTokenHeader);
            if(authTokenHeader!=null){
                String token = authTokenHeader.substring(authTokenHeader.lastIndexOf("Bearer") + 7);
                Claims claims = Jwts.parser()
                        .setSigningKey(DatatypeConverter.parseBase64Binary("secretkey"))
                        .parseClaimsJws(token).getBody();


                req.setAttribute("Authorization", token);
                //this is not really needed: once the check has been passed, then the user is authorized, there is
                //no need to pass forward the token. But, since the next page displays it, then we need to pass it
                //forward. (remember the doPost of the TokenVisualizerServlet!)



                chain.doFilter(req, res); // User is logged in, just continue request.
            }
            else {
                //take from the request, the parameters (email and password)
                String email = req.getParameter("email");
                String password = req.getParameter("password");

                if (email == null || email.equals("")) {
                    //the email is null (was not set on the parameters) or an empty string
                    //notify this to the user
                    ErrorCode ec = ErrorCode.EMAIL_MISSING;
                    res.setStatus(ec.getHTTPCode());
                    Message m = new Message(true, "missing email");

                    //we used jsp for the login page: thus we forward the request
                    req.setAttribute("message", m);
                    req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);

                } else if (password == null || password.equals("")) {
                    //the password was empty
                    ErrorCode ec = ErrorCode.EMAIL_MISSING;
                    res.setStatus(ec.getHTTPCode());
                    Message m = new Message(true, "missing password");
                    req.setAttribute("message", m);
                    req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);

                } else {
                    //try to authenticate the user
                    User u = new GetUserByMailAndPasswordDatabase(getDataSource().getConnection(), new User(email, password)).getUserByMailAndPassword();

                    if (u == null) {
                        //if not, tell it to the userreq.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
                        ErrorCode ec = ErrorCode.WRONG_CREDENTIALS;
                        res.setStatus(ec.getHTTPCode());
                        Message m = new Message(true, "credentials are wrong");
                        req.setAttribute("message", m);
                        req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
                    } else {

                        //a token without a validity time
                        /*
                        String token = Jwts.builder().setSubject(u.getEmail())
                                .claim("role", u.getRole()).setIssuedAt(new Date())
                                .signWith(SignatureAlgorithm.HS256, "secretkey").compact();

                        */


                        //a token with a validity time
                        long now = (new Date()).getTime();
                        Date validity;
                        validity = new Date(now + 10000000);

                        String token = Jwts.builder().setSubject(u.getEmail())
                                .claim("role", u.getRole()).setIssuedAt(new Date()).setExpiration(validity)
                                .signWith(SignatureAlgorithm.HS256, "secretkey").compact();
                        req.setAttribute("Authorization", token);
                        chain.doFilter(req, res); // User is logged in, just continue request.
                    }
                }
            }


        } catch (NamingException | SQLException e) {
            //something unexpected happened: we write it into the logger
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        } catch (ExpiredJwtException e){
            writeError(res, ErrorCode.TOKEN_EXPIRED);
        }  catch (SignatureException e){
            writeError(res, ErrorCode.TOKEN_TAMPERED);
        }
    }
}
