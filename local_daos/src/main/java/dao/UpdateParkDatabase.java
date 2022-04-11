package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateParkDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "UPDATE amupark.park SET email=?, address=? WHERE name=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The user to be inserted
     */
    Park park;

    public UpdateParkDatabase(final Connection con, final Park u) {
        this.con = con;
        this.park = u;
    }

    public Park updatePark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Park updatedPark = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getEmail());
            pstmt.setString(2, park.getAddress());
            pstmt.setString(3, park.getName());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                updatedPark = new Park(rs.getString(1), rs.getString(2), rs.getString(3));
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

        return updatedPark;
    }

}
