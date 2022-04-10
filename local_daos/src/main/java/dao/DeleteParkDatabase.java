package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteParkDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "DELETE FROM amupark.park WHERE name=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The park to be deleted
     */
    Park park;

    public DeleteParkDatabase(final Connection con, final Park u) {
        this.con = con;
        this.park = u;
    }

    public Park deletePark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created park
        Park deletedPark = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getName());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                deletedPark = new Park(rs.getString(1), rs.getString(2), rs.getString(3));

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

        return deletedPark;
    }

}
