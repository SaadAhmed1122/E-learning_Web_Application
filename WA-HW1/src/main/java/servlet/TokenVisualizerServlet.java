package servlet;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.xml.bind.DatatypeConverter;

import java.io.IOException;
import java.util.Enumeration;

public class TokenVisualizerServlet extends AbstractServlet{

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String webPage = "<html>";

        webPage += "<head> <title> Simple Page to visualize tokens </title></head>";
        webPage += "<body>";

        webPage += "<h1> CORRECT TOKEN </h1>";
        webPage += "token: ";

        String stringToken = req.getAttribute("Authorization").toString();

        webPage += stringToken+"<br/>";

        webPage += "Not so clear, I'm afraid ... <br/>";



        webPage += "If we parse it though...<br/>";

        Claims claims = Jwts.parser()
                .setSigningKey(DatatypeConverter.parseBase64Binary("secretkey"))
                .parseClaimsJws(stringToken).getBody();

        webPage += "subject: "+claims.getSubject()+"<br/>";
        webPage += "role: "+claims.get("role")+"<br/>";
        webPage += "issued: "+claims.getIssuedAt()+"<br/>";

        /*
        webPage += "<h1> TAMPERED TOKEN </h1>";
        //tampered Token
        stringToken = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJndWdsaWVsbW8uZmFnZ2lvbGlAcGFya3ZpbGxlLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYxODMxMzcwN30.Sono_Un_Utente_Molto_Malevolo";

        webPage += stringToken+"<br/>";

        claims = Jwts.parser()
                .setSigningKey(DatatypeConverter.parseBase64Binary("secretkey"))
                .parseClaimsJws(stringToken).getBody();

        webPage += "subject: "+claims.getSubject()+"<br/>";
        webPage += "role: "+claims.get("role")+"<br/>";
        webPage += "issued: "+claims.getIssuedAt()+"<br/>";


        webPage += "<h1> TOKEN PARSED WITH THE WRONG KEY </h1>";

        claims = Jwts.parser()
            .setSigningKey(DatatypeConverter.parseBase64Binary("wrongkey"))
            .parseClaimsJws(stringToken).getBody();



        webPage += "claims with wrong key: "+claims.toString()+"<br/>";
        */
        webPage += "</body></html>";


        res.getWriter().write(webPage);

        res.setHeader("Authorization", stringToken);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String authTokenHeader = req.getHeader("Authorization");

        String token = authTokenHeader.substring(authTokenHeader.lastIndexOf("Bearer") + 8);

        res.getWriter().write(token);
    }

}