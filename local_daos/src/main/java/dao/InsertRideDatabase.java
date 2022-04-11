package dao;

import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertRideDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "INSERT INTO amupark.ride (description, parkid, modelid) VALUES (?, ?, ?) RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The ride to be inserted
     */
    Ride ride;

    public InsertRideDatabase(final Connection con, final Ride r) {
        this.con = con;
        this.ride = r;
    }

    public Ride insertRide() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Ride newRide = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, ride.getDescription());
            pstmt.setString(2, ride.getParkid());
            pstmt.setString(3, ride.getModelid());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                newRide = new Ride(rs.getInt(1), rs.getString(2),
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

        return newRide;
    }

}
