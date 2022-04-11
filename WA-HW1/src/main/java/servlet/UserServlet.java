package servlet;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import resource.Message;
import resource.User;
import utils.ErrorCode;

import javax.naming.NamingException;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class UserServlet extends AbstractServlet{


    //the doGet method is used only to logout the user
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //take the request uri
        //and remove everything prior to /user/ (included) and use the remainder as
        //indicator for the required operation
        String op = req.getRequestURI().split("/", 4)[3];

        try{

            //invalidate the user session
            //redirect the browser to the homepage
            switch (op) {
                case "logout/" -> {
                    req.getSession().invalidate();
                    res.sendRedirect(req.getContextPath() + "/jsp/homepage.jsp");
                }
                case "protected/email/" -> {
                    String email = req.getParameter("email");
                    if (email == null || email.equals("")) {
                        ErrorCode ec = ErrorCode.EMAIL_MISSING;
                        res.setStatus(ec.getHTTPCode());
                        writeError(res, ec);
                    } else {
                        res.setContentType("application/json");
                        JSONObject resJSON = new JSONObject();
                        res.setStatus(HttpServletResponse.SC_OK);
                        resJSON.put("data", new GetUserByMailDatabase(getDataSource().getConnection(), new User(email)).getUserByMail().toJSON());
                        res.getWriter().write(resJSON.toString());
                    }
                }
                case "protected/userlist/" -> {
                    res.setContentType("application/json");
                    res.getWriter().write(new JSONObject()
                            .put("emails_list",
                                    new ListUsersEmailsDatabase(getDataSource().getConnection()).listUsersEmails())
                            .toString());
                }
                default -> writeError(res, ErrorCode.OPERATION_UNKNOWN);
            }
        } catch (NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }

    }

    public void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //parse URI
        String op = req.getRequestURI().split("/", 4)[3];

        switch (op) {
            case "protected/email/":
                deletionOperations(req, res);
                break;
            default:
                writeError(res, ErrorCode.OPERATION_UNKNOWN);
        }
    }


    //post requests used both to login and to register a new user
    //URI: /user/login/ allows to login a user
    //URI: /user/register/ allows registering a new user
    //URI: /user/update/ allows to update a user
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //parse URI
        String op = req.getRequestURI().split("/", 4)[3];
        System.out.println(op);
        switch (op) {
            // the requested operation is login
            case "login/" -> loginOperations(req, res);
            // the requested operation is register
            case "register/" -> registrationOperations(req, res);
            // the requested operation is update user
            case "protected/update/" -> {
                System.out.println("DOVREI AGGIORNARE ADESSO");
                updateOperations(req, res);
            }
            // the requested operation is unknown
            default -> writeError(res, ErrorCode.OPERATION_UNKNOWN);
        }
    }



    public void loginOperations(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {

            boolean loggable=true;
            ErrorCode ec = null;
            Message m = null;


            //take from the request, the parameters (email and password)
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User u = new User(email, password);
            User loggedUser=null;
            if (email == null || email.equals("")) {
                //the email is empty
                loggable = false;
                ec = ErrorCode.EMAIL_MISSING;
                m = new Message(true, "missing email");

            } else if (password == null || password.equals("")) {
                //the password was empty
                loggable = false;
                ec = ErrorCode.EMAIL_MISSING;
                m = new Message(true, "missing password");

            } else{
                //try to authenticate the user
                //check if email exists and the password matches
                loggedUser = new GetUserByMailAndPasswordDatabase(getDataSource().getConnection(), u).getUserByMailAndPassword();
                if (loggedUser == null) {
                    loggable = false;
                    //if not, tell it to the user
                    ec = ErrorCode.WRONG_CREDENTIALS;
                    m = new Message(true, "credentials are wrong");
                }
            }


            if (loggable){
                // activate a session to keep the user data
                HttpSession session = req.getSession();

                // insert in the session the email an the role
                session.setAttribute("email", loggedUser.getEmail());
                session.setAttribute("role", loggedUser.getRole());

                // login credentials were correct: we redirect the user to the homepage
                // now the session is active and its data can used to change the homepage
                res.sendRedirect(req.getContextPath()+"/jsp/homepage.jsp");
            } else {
                res.setStatus(ec.getHTTPCode());
                req.setAttribute("message", m);
                req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
            }

        } catch (NamingException | SQLException e){
            //something unexpected happened: we write it into the logger
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    public void registrationOperations(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {

            boolean registrable = true;
            //get the registration patameters
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String rpassword = req.getParameter("rpassword");
            String first_name = req.getParameter("first_name");
            String last_name  = req.getParameter("last_name");

            ErrorCode ec = null;
            Message m = null;
            User u = null;

            //check that all registrations parameters have been set and are not null
            if (email==null||email.equals("")||  first_name==null||first_name.equals("")||
                password==null|| password.equals("")|| rpassword==null||rpassword.equals("")||
                last_name==null||last_name.equals("")){

                registrable = false;
                //if not, notify it to the user
                ec = ErrorCode.EMPTY_INPUT_FIELDS;
                m = new Message(true, "Some fields are empty");

            }
            // check that the password and the repeated password are equal
            else if (!password.equals(rpassword)){

                registrable = false;
                //if not, notify it to the user
                ec = ErrorCode.DIFFERENT_PASSWORDS;
                m = new Message(true, "Passwords do not coincide");

            } else {
                u = new User(email, password, first_name, last_name, "base");

                //if the email has been already used (the DAO did not return null)
                if (new GetUserByMailDatabase(getDataSource().getConnection(), u).getUserByMail() != null) {
                    registrable = false;
                    //notify it to the user
                    ec = ErrorCode.MAIL_ALREADY_USED;
                    m = new Message(true, "This mail has been already used");
                }
            }

            if(registrable) {
                //else, create a new user resource

                //pass it to the dao to register it
                User newUser = new InsertUserDatabase(getDataSource().getConnection(), u).insertUser();
                if (newUser!=null) {
                    //if the registration ended correctly, forward the user to the
                    //login service: note that, now the login service will login the user
                    //and create the session. We are not redirecting the user to the
                    //login page
                    sendEmail(email, first_name, last_name);
                    req.getRequestDispatcher("/user/login/").forward(req, res);
                } else {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                }
            } else {
                res.setStatus(ec.getHTTPCode());
                req.setAttribute("message", m);
                req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
            }


        } catch (SQLException | NamingException | ServletException e) {
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }

    public void updateOperations(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try{
            String email = req.getParameter("email");
            String first_name = req.getParameter("first_name");
            String last_name = req.getParameter("last_name");
            String role = req.getParameter("role");
            if(email==null){
                writeError(res, ErrorCode.EMAIL_MISSING);
                System.out.println("email_missing");
            }
            else if(first_name==null|| first_name.equals("")||
                    last_name==null|| last_name.equals("")||
                    role==null|| role.equals("")){
                writeError(res, ErrorCode.EMPTY_INPUT_FIELDS);
                System.out.println("empty_input_fields");
            } else {
                //is role admissible?
                List<String> roles = new ListRolesDatabase(getDataSource().getConnection()).listRoles();
                if (roles == null) {
                    writeError(res, ErrorCode.INTERNAL_ERROR);
                    System.out.println("internal_error");
                }
                else if (!roles.contains(role)){
                    writeError(res, ErrorCode.UNRECOGNIZED_ROLE);
                    System.out.println("unrecognized_role");
                } else {
                    if (new UpdateUserNotPasswordDatabase(getDataSource().getConnection(),
                            new User(email, first_name, last_name, role))
                            .updateUserNotPassword()!=null){
                        res.setStatus(HttpServletResponse.SC_OK);
                    } else{
                        writeError(res, ErrorCode.INTERNAL_ERROR);
                        System.out.println("internal_error");
                    }
                }
            }
        } catch (SQLException | NamingException e) {
            writeError(res, ErrorCode.INTERNAL_ERROR);
            System.out.println("internal_error_exception");
            logger.error("stacktrace:", e);
        }
    }

    public void deletionOperations(HttpServletRequest req, HttpServletResponse res) throws IOException {

        try {
            String email = req.getParameter("email");
            System.out.println(email);
            if(email==null){
                writeError(res, ErrorCode.EMAIL_MISSING);
            }
            else {
                User u = new User(email);
                User delUser = new DeleteUserDatabase(getDataSource().getConnection(), u).deleteUser();
                System.out.println(delUser);
                if (delUser != null) {
                    res.setStatus(HttpServletResponse.SC_OK);
                    res.setContentType("application/json");
                    res.getWriter().write(new JSONObject().put("success", "user removed").toString());
                } else {
                    writeError(res, ErrorCode.DELETED_USER_NOT_PRESENT);
                }
            }
        } catch (IOException | NamingException | SQLException e){
            writeError(res, ErrorCode.INTERNAL_ERROR);
            logger.error("stacktrace:", e);
        }
    }


    private void sendEmail(String to, String first_name, String last_name) {

        // Sender's email ID needs to be mentioned
        String from = "noreply@aaahmupark.com";
        // Assuming you are sending email from localhost
        String host = "localhost";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.setProperty("mail.smtp.host", host);
        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);


        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Welcome to AAAHmusement park!");
            // Now set the actual message
            message.setText("Dear "+first_name+" "+last_name+",\n"+
                    "We warmly welcome you in our brand new site.\n\n"+
                    "Kind regards,\n"+
                    "AAAHmusement park inc.");

            // Send message
            Transport.send(message);

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

}