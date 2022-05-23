package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import resource.Park;

public class ListParksDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.park;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * Creates a new object for list all the roles in the database
     *
     * @param con
     *            the connection to the database.
     */
    public ListParksDatabase(final Connection con) {
        this.con = con;
    }

    /**
     * List all the roles in the database.
     *
     * @return the List of {@code String} corresponding to the roles in the database.
     *
     * @throws SQLException
     *             if any error occurs while reading the roles.
     */
    public List<Park> listParks() throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Park> parks = new ArrayList<>();


        try {
            pstmt = con.prepareStatement(STATEMENT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                parks.add(new Park (rs.getString(1), rs.getString(2), rs.getString(3)));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }

            if (pstmt != null) {
                pstmt.close();
            }

            con.close();
        }

        return parks;
    }

}
