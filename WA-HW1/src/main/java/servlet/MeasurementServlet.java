package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.naming.NamingException;
import java.io.File;
import java.io.IOException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class MeasurementServlet extends AbstractServlet {


    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String op = req.getRequestURI();
        op = op.substring(op.lastIndexOf("measurement")+12);

        switch (op){
            case "upload/":
                /* Receive file uploaded to the Servlet from the HTML5 form */
                Part filePart = req.getPart("file");
                String fileName = filePart.getSubmittedFileName();
                /*
                File myObj = new File("/home/guglielmo/Desktop/" + fileName);
                if (myObj.createNewFile()) {
                    System.out.println("File created: " + myObj.getName());
                } else {
                    System.out.println("File already exists.");
                }
                */
                for (Part part : req.getParts()) {
                    part.write("/home/guglielmo/Desktop/WEBAPP/storedFiles/" + fileName);
                }
                res.getWriter().print("The file uploaded sucessfully.");
                logger.info("file uploaded successfully");
                break;
        }
    }
}
