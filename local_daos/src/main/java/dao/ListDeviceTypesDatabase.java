package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListDeviceTypesDatabase {


    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT unnest(enum_range(NULL::amupark.devicetypes));";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * Creates a new object for list all the device types in the database
     *
     * @param con
     *            the connection to the database.
     */
    public ListDeviceTypesDatabase(final Connection con) {
        this.con = con;
    }

    /**
     * List all the event categories in the database.
     *
     * @return the List of {@code String} corresponding to the device types in the database.
     *
     * @throws SQLException
     *             if any error occurs while reading the device types.
     */
    public List<String> listDeviceTypes() throws SQLException {

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
