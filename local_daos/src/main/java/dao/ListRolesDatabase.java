package dao;

import java.sql.*;
import java.util.*;

public class ListRolesDatabase {


    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT unnest(enum_range(NULL::amupark.roles));";
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
    public ListRolesDatabase(final Connection con) {
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
    public List<String> listRoles() throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> enumValues = new ArrayList<>();


        try {
            pstmt = con.prepareStatement(STATEMENT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                enumValues.add(rs.getString(1));
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

        return enumValues;
    }
}
