package dao;

import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateRideDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT =  "UPDATE amupark.ride SET description=?, parkid=?, modelid=? WHERE rideid=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The ride to be updated
     */
    Ride ride;

    public UpdateRideDatabase(final Connection con, final Ride r) {
        this.con = con;
        this.ride = r;
    }

    public Ride updateRide() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Ride updatedRide = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, ride.getDescription());
            pstmt.setString(2, ride.getParkid());
            pstmt.setString(3, ride.getModelid());
            pstmt.setInt(4, ride.getRideid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                updatedRide = new Ride(rs.getInt(1), rs.getString(2),
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

        return updatedRide;
    }

}
