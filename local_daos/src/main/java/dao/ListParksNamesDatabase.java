package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListParksNamesDatabase {
    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT name FROM amupark.park;";
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
    public ListParksNamesDatabase(final Connection con) {
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
    public List<String> listParksNames() throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> parksNames = new ArrayList<>();


        try {
            pstmt = con.prepareStatement(STATEMENT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                parksNames.add(rs.getString(1));
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

        return parksNames;
    }

}
