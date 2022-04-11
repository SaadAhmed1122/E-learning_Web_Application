package dao;

import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteRideDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "DELETE FROM amupark.ride WHERE rideid=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The ride to be deleted
     */
    Ride ride;

    public DeleteRideDatabase(final Connection con, final Ride r) {
        this.con = con;
        this.ride = r;
    }

    public Ride deleteRide() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created ride
        Ride deletedRide = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, ride.getRideid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                deletedRide = new Ride(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));
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

        return deletedRide;
    }

}
