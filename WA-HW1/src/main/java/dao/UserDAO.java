package dao;

import resource.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    /*public static List<User> getStudentList(Connection conn) throws SQLException {
        PreparedStatement stmnt = null;
        ResultSet result = null;

        String query = "SELECT * FROM libraryapp.user;";

        try {
            stmnt = conn.prepareStatement(query);

            result = stmnt.executeQuery();

            ArrayList<User> students = new ArrayList<>();

            while (result.next()) {
                String email = result.getString("salt");
                String first_name = result.getString("name");
                String last_name = result.getString("surname");
                String role = result.getString("role");
                students.add(new User(email, first_name, last_name, role));
            }
            return students;
        } finally {
            cleaningOperations(stmnt, result, conn);
        }
    }*/
    
}
